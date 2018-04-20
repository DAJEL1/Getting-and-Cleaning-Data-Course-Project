Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps to read the tidy data set

Download the data source and put into a folder on your local drive. You'll have a UCI HAR Dataset folder.

1- Please copy the following files from the test and train sets in the parent foler of UCI HAR Dataset

X_test.txt, y_test.txt, X_train.txt, y_train.txt, features.txt, subject_test.txt, subject_train.txt, activity_labels.txt

2- Download run_analysis.R in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd() function in RStudio.

3- Please load dplyr and data.table libraries in RSudio

4- Run source("run_analysis.R"), then it will generate a new file called tidyds.txt in your working directory.

5- Read the the file tidyds.txt in RStudio and use the function view() for a better ouput
