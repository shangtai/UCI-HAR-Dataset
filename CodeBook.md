## Code Book

### Data Source

The data source for the project is the following:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description of the original data is available from 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Process of Data Cleaning

1. We first extracts only the measurements on the mean and standard deviation for each measurement. (Note that we do not include meanFreq()). This is done by looking for keywords std() and mean().
2. We merge the training and the test sets to create one data set. Keeping only those relevant features.
3. We add subject ids and the activities to the data frame.
4. The activities are being renamed according to "activities_labels.txt".

The data set that we have created so far is stored in the variable firstdata in run_analysis.R
 
From that data set, we create a second, independent tidy data set with the average of each variable for each activity and each subject.
The data is sorted according to the users and also by their activities (using the order introduced in activities_label.txt)

The data is stored is the file called tidydata.txt.
