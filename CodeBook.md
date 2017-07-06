# Instructions and Information on run_analysis.R script for reading activity dataset
This CodeBook contains detail about Getting and Cleaning Data Peer Reviewed Assignment. Data set considered here is activity data and details about source data set is mentioned below.
Task was to consider only mean and standard deviation variables in source data and tidy datasets.

## About source data
As source data for work was used Human Activity Recognition Using Smartphones Data Set. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## About R script
Steps and Transformations performed in R script

# 1. Download and Unzipping Dataset
Code performs below checks so that everytime when code runs it does not download source data
  * if ~/Data Science/GACD_Assignment path is present if not then it creates required direcotry
  * if Dataset.zip file exists then it does not download and unzip source data
  
 # 2. Merging Data Sets and Assigning Column Names
 Code reads training and test data sets from text files and loads in variables
 ## training data set variables
    * x_train
    * y_train
    * subject_train
## test data set variables
    * x_test
    * y_test
    * subject_test
    
## Reading feature and activity label text file
    * features
    * activity_label

## Assigning Column Names
    * Assign columns names to trainign and test data set using features and activity_label files
    
## Merging data sets
    * Code merges training and test data sets in x_data variable along with activity and subject data
    
# 3. Extracting Meand and Standard deviation measurement for each observation
## Finding and creating logical vector for activityId, subjectid, mean and standard deviation columns
    * x_data_col_index is logical vector required for columns
    
## Subset data using logical vector
    * x_data_mean_std is subset of x_data with required columns

# Using activity names
## Merge acticity_label and x_data_mean_std to get activity names based on activityId
    * x_data_mean_std_activity_name contains data set with activity names
   
  ## Using descriptive names for columns
  prefix t is replaced by time
  Acc is replaced by Accelerometer
  Gyro is replaced by Gyroscope
  prefix f is replaced by frequency
  Mag is replaced by Magnitude
  BodyBody is replaced by Body
  
  # Creating a second, independent tidy data set with the average of each variable for each activity and each subject:
  ## Making second tidy data set
      * Code performs aggregate mean of observation by activityId and subjectId and stores it in another_x_data_mean_std
      * Data is sorted based on subjectId and activityId
      
## Writing in tidy dataset in file
    * Second tidy data set is written in ~/Data Science/GACD_Assignment/another_tidy_dataset.txt file
  

## About variables:   
* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_data` merge the above datasets to further analysis.
*  `x_data_col_index` is logical vector of columns containing Activity Id, Subject Id, mean, standard deviation measurement
* `x_data_mean_std` contains subset of data with only columns having mean and standard deviation measurements for observation
* `x_data_mean_std_activity_name` contains data set with activity names
* `another_x_data_mean_std` contains tidy data set
 
