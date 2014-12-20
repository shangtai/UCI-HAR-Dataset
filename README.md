## Getting and Cleaning Data Project 

Note that the code was run on a Windows Computer.

To run the code "run_analysis.R" you will need this data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

To run the program
* Unpack the data and set the working directory to be "UCI HAR Dataset"
* Place the code of run_analysis.r in the folder
* You can then run the code by the command source("run_analysis.r")

The run_analysis.R will 
* Merge the training and the test sets to create one data set.
* Extract only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Create an independent data set with the average of each variable for each activity and each subject.
* The file "tidydata.txt" will be created in our working directory.