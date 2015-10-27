# Getting and Cleaning Data

## Course Project - README

This repositry contains the code used to clean and tidy the data supplied for the course project.
'run_analysis.R' assumes that the folder 'UCI HAR Dataset' containing the data is already in the working directory and then follows these steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The output is stored in the file 'averages_data.txt'.
