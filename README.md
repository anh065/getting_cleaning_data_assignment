#Getting and Cleaning Data Course Project

##Author

Anh Bui - anhbui@flowsim3d.com

##Instructions

Clone this repository and run the run_analysis.R script from within the cloned repository root directory, 
which also contains uncompressed data directory.

##Data Source

This project uses the "Human Activity Recognition Using Smartphones Dataset" which should be downloaded
from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and uncompressed to 
the directory where run_analysis.R is located. 

##Script description

The run_analysis.R script does the following

* Merges the training and the test sets to create one data set
* Extracts only the measurements on the mean and standard deviation for each measurement
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* Creates a new tidy data set with the average of each variable for each activity and each subject.
