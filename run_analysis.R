#Download the zip file and put it in a folder
if(!file.exists("./Poject3")){dir.create("./Project3")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Project3/Dataset.zip")

#Unzip the file
unzip(zipfile="./Project3/Dataset.zip",exdir="./project")

#List the unzipped files, they are in folder UCI HAR DATASET
dataPath <- file.path("./project" , "UCI HAR Dataset")
dataFiles<-list.files(dataPath, recursive=TRUE)
dataFiles

#activity files
testActData  <- read.table(file.path(dataPath, "test" , "Y_test.txt" ),header = FALSE)
trainActData <- read.table(file.path(dataPath, "train", "Y_train.txt"),header = FALSE)

#subject files
testSubData  <- read.table(file.path(dataPath, "test" , "subject_test.txt"),header = FALSE)
trainSubData <- read.table(file.path(dataPath, "train", "subject_train.txt"),header = FALSE)

#features files
testFeatData  <- read.table(file.path(dataPath, "test" , "X_test.txt" ),header = FALSE)
trainFeatData <- read.table(file.path(dataPath, "train", "X_train.txt"),header = FALSE)

#rbind the datasets
subData <- rbind(trainSubData, testSubData)
actData <- rbind(trainActData, testActData)
featData <- rbind(trainFeatData, testFeatData)

#set variable names
names(subData)<-c("subject")
names(actData)<- c("activity")
featNames <- read.table(file.path(dataPath, "features.txt"),head=FALSE)
names(featData)<- featNames$V2

#merge datasets at columns to get final Data
combData <- cbind(subData, actData)
Data <- cbind(featData, combData)

#subset names of the features containing mean and standard deviation
featSubNames<-featNames$V2[grep("mean\\(\\)|std\\(\\)", featNames$V2)]

#subset Data fro selected features above only
Data<-subset(Data,select=c(as.character(featSubNames), "subject", "activity" ))

#correct activity names
actLabels <- read.table(file.path(dataPath, "activity_labels.txt"),header = FALSE)
Data[, "activity"] <- actLabels[Data[, "activity"], 2]

#creating required tidy data set
library(plyr);
tidyData<-aggregate(. ~subject + activity, Data, mean)
tidyData<-tidyData[order(tidyData$subject,tidyData$activity),]
write.table(tidyData, file = "tidydata.txt",row.name=FALSE)

