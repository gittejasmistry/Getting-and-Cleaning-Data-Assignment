# Instructions and Information on run_analysis.R script for reading activity dataset
This CodeBook contains detail about Getting and Cleaning Data Peer Reviewed Assignment. Data set considered here is activity data and details about source data set is mentioned below.
Task was to consider only mean and standard deviation variables in source data and tidy datasets.

## About source data
As source data for work was used Human Activity Recognition Using Smartphones Data Set. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## About R script
File with R code "run_analysis.R" perform 5 following steps (in accordance assigned task of course work):   
1. Merging the training and the test sets to create one data set.   
  1.1 Reading files    
    1.1.1 Reading trainings tables   
    1.1.2 Reading testing tables   
    1.1.3 Reading feature vector   
    1.1.4 Reading activity labels   
  1.2 Assigning column names   
  1.3 Merging all data in one set   
2. Extracting only the measurements on the mean and standard deviation for each measurement   
  2.1 Find only columns with measurements on mean and standard deviations and create logical vector  x_data_col_index
  2.2 Making necessary subset from x_data using logical vector from above step  
3. Using descriptive activity names to name the activities in the data set   
4. Appropriately labelling the data set with descriptive variable names   
5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject   
  5.1 Making second tidy data set   
  5.2 Writing second tidy data set in txt file   

## About variables:   
* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_data` merge the above datasets to further analysis.
*  `x_data_col_index` is logical vector of columns containing Activity Id, Subject Id, mean, standard deviation measurement
* `x_data_mean_std` contains subset of data with only columns having mean and standard deviation measurements for observation
* `x_data_mean_std_activity_name` contains data set with activity names
* `another_x_data_mean_std` contains tidy data set
 