#Getting and Cleaning Data Course Assignment

##Data Source

The dataset used in this assignment was collected by the Samsung Galaxy S smartphone sensors. 
A full description is available at the following site:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset can be downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Using the phone embedded accelerometer and gyroscope, data on 3-axial linear acceleration and 
3-axial angular velocity were obtained for a group of 30 volunteers (subjects) doing six activities
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The obtained dataset has 
been randomly partitioned into two sets, where 70% of the volunteers was selected for generating 
the training data and 30% the test data. 

The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector
- 'features.txt': List of all features
- 'activity_labels.txt': Links the class labels with their activity name
- 'train/X_train.txt': Training set
- 'train/y_train.txt': Training labels
- 'train/subject_train.txt': Training subjects
- 'test/X_test.txt': Test set
- 'test/y_test.txt': Test labels
- 'test/subject_train.txt': Test subjects

Measurement data are located inside 'X_\*.txt'. In this file each row contains 561 data points 
corresponding to different data types (features). Descriptions of all columns (features) can be found in 'features.txt'. Each
row of data was obtained for a specific volunteer (subject) doing a specific activity. Information about the corresponding 
subject and activity for each data row can be found in 'y_\*.txt' and 'subject_\*.txt'

##Variables

The main variables are:

- The activity labels which can be WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING
- The volunders/subjects represented by a number in the range from 1 to 30
- The measurement types or features. There are many types of data in the dataset
  but only data concerning the means and the corresponding standard deviations will be extracted and used.
  
##Transformations

- Trainging and test measurement data were read from the files and merged 
- Corresponding activity labels and subject indices were also read from the files and merged
- Activity labels were replaced by descriptive names
- The lists of subject indices and descriptive activity names were appended the measurement data frame
- Data ordering based on subject and activity was performed
- Mean and standard deviation columns were extracted from the data frame
- A new tidy data set with the average of each variable for each activity and each subject was created with the 'aggregate' function
  and written out to 'tidyData.txt' file.
