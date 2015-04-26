---
title: "code_book"
---
## CODE BOOK

### run_analysis.R description

A run_analysis.R script contains a set of instructions that allow to get from row data, which can be found https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, to tidy dataset. The result of the script was written into tidy_data file. The script does as follow:

1. reads both test and training data from a file and merges them.
2. sets a descriptive values names
3. extracts only the measurements on the mean and standard deviation for each measurement
4. adds a column with descriptive names of activities
5. creates aggregated dataset with average of each variable for each activity and each subject
6. writes final dataset into a file tidy_data.txt

#### R version

The script was run using R, version 3.1.2

### CODE BOOK

1. subject: 
    *  1,2,3,… 30 
    *  an integer number from 1 to 30 that represents one of 30 volunteers
    *  type: int


2.  desc_activity: 
    * laying, sitting, standing, walking, walking_downstairs, walking upstairs 
    * a description name of activity
    * type: factor, 6 levels


3.  measure 
    * one of the following values:
        *  tBodyAcc-mean()-X
        *  tBodyAcc-mean()-Y
        *  tBodyAcc-mean()-Z
        *  tBodyAcc-std()-X
        *  tBodyAcc-std()-Y
        *  tBodyAcc-std()-Z
        *  tGravityAcc-mean()-X
        *  tGravityAcc-mean()-Y
        *  tGravityAcc-mean()-Z
        *  tGravityAcc-std()-X
        *  tGravityAcc-std()-Y
        *  tGravityAcc-std()-Z
        *  tBodyAccJerk-mean()-X
        *  tBodyAccJerk-mean()-Y
        *  tBodyAccJerk-mean()-Z
        *  tBodyAccJerk-std()-X
        *  tBodyAccJerk-std()-Y
        *  tBodyAccJerk-std()-Z
        *  tBodyGyro-mean()-X
        *  tBodyGyro-mean()-Y
        *  tBodyGyro-mean()-Z
        *  tBodyGyro-std()-X
        *  tBodyGyro-std()-Y
        *  tBodyGyro-std()-Z
        *  tBodyGyroJerk-mean()-X
        *  tBodyGyroJerk-mean()-Y
        *  tBodyGyroJerk-mean()-Z
        *  tBodyGyroJerk-std()-X
        *  tBodyGyroJerk-std()-Y
        *  tBodyGyroJerk-std()-Z
        *  tBodyAccMag-mean()
        *  tBodyAccMag-std()
        *  tGravityAccMag-mean()
        *  tGravityAccMag-std()
        *  tBodyAccJerkMag-mean()
        *  tBodyAccJerkMag-std()
        *  tBodyGyroMag-mean()
        *  tBodyGyroMag-std()
        *  tBodyGyroJerkMag-mean()
        *  tBodyGyroJerkMag-std()
        *  fBodyAcc-mean()-X
        *  fBodyAcc-mean()-Y
        *  fBodyAcc-mean()-Z
        *  fBodyAcc-std()-X
        *  fBodyAcc-std()-Y
        *  fBodyAcc-std()-Z
        *  fBodyAcc-meanFreq()-X
        *  fBodyAcc-meanFreq()-Y
        *  fBodyAcc-meanFreq()-Z
        *  fBodyAccJerk-mean()-X
        *  fBodyAccJerk-mean()-Y
        *  fBodyAccJerk-mean()-Z
        *  fBodyAccJerk-std()-X
        *  fBodyAccJerk-std()-Y
        *  fBodyAccJerk-std()-Z
        *  fBodyAccJerk-meanFreq()-X
        *  fBodyAccJerk-meanFreq()-Y
        *  fBodyAccJerk-meanFreq()-Z
        *  fBodyGyro-mean()-X
        *  fBodyGyro-mean()-Y
        *  fBodyGyro-mean()-Z
        *  fBodyGyro-std()-X
        *  fBodyGyro-std()-Y
        *  fBodyGyro-std()-Z
        *  fBodyGyro-meanFreq()-X
        *  fBodyGyro-meanFreq()-Y
        *  fBodyGyro-meanFreq()-Z
        *  fBodyAccMag-mean()
        *  fBodyAccMag-std()
        *  fBodyAccMag-meanFreq()
        *  fBodyBodyAccJerkMag-mean()
        *  fBodyBodyAccJerkMag-std()
        *  fBodyBodyAccJerkMag-meanFreq()
        *  fBodyBodyGyroMag-mean()
        *  fBodyBodyGyroMag-std()
        *  fBodyBodyGyroMag-meanFreq()
        *  fBodyBodyGyroJerkMag-mean()
        *  fBodyBodyGyroJerkMag-std()
        *  fBodyBodyGyroJerkMag-meanFreq()  
    * data from the smartfon's accelerometer and gyroscope. For more details see feature_info.txt provided with the source data.
    * type: factor 79 levels


4.  mean_value an average value of measurement for activity and subject     
    * type: numeric