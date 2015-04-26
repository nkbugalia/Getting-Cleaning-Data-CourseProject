# Steps taken to Transform

The script `run_analysis.R`performs the required steps in course project problem statement.
* Download the zip file and put it in a folder, and the Unzip the file.
* Then, List the unzipped files, they are in the main folder, and make individual data frames for all files (activity, subject and features for both test and train).
* rbind the test and train datasets to get merged Subject, Activity and Feature datasets.
* set meaningful names for the merged datasets (features.txt) and the use cbind to merge the columns to get a merged raw data set.
* subset the dataset for only those columns which have the mean and standard deviation measures are taken from the whole dataset.
* asaign the activity labels for values 1:6 (activity_labels.txt) and then substitute them in original data set.
* Finally, we aggregate a new dataset with all the average measures for each subject and activity type (30 subjects  across  6 activities giving 180 observations). The final tidy dataset ouptput is stored in 'tidydata.txt', which is then uploaded through Coursera and also in this repo.


# Information on variables

* 'fileUrl' has the supplied URL, 'dataPath' contains the path of the unzipped folder for all files.
* 'testActData', 'trainActData', 'testSubData', 'trainSubData', 'testFeatData' and 'trainFeatData' contain individual data frames for Test and Training data for Activity, Subject and Features.
* 'subData', 'actData' and 'featData' have the merged dataframes (test and train) from Subject, Activity and Features using rbind().
* 'featNames' extracts the feature variable names from feature.txt and then it is used to replace the existing names in 'featData' with meaningful names.
* 'Data' is the result of cbind() on 'subData', 'actData' and 'featData', which is the base of final merged dataset. 'Data' is the subsetted for only mean and standard deviation variables.
* 'actLabels' extracts correct activity names from 'activity_labels.txt' which are then replaced in 'Data' instead 1:6.
* 'tidyData' is then the final aggregate of the mean of all subjects across across all activities, which is then written into a text file called 'tidydata.text' which is supplied through coursera and also in the repo.