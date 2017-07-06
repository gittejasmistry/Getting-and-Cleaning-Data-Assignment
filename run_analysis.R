
  
  # 1. Downloading and Unziping Dataset
  
  if(!file.exists("~/Data Science/GACD_Assignment"))
    {dir.create("~/Data Science/GACD_Assignment")}
  
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
  ## If Dataset already exists then dont download again
  if(!file.exists("~/Data Science/GACD_Assignment/Dataset.zip"))
  {
    download.file(fileUrl,destfile="~/Data Science/GACD_Assignment/Dataset.zip")
  
    # Unzip dataSet to /data directory
    unzip(zipfile="~/Data Science/GACD_Assignment/Dataset.zip",exdir="~/Data Science/GACD_Assignment")
  }
  
  
  # Merge training and  test data sets
  ## Read training data set
  x_train <- read.table("~/Data Science/GACD_Assignment/UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("~/Data Science/GACD_Assignment/UCI HAR Dataset/train/y_train.txt")
  subject_train <- read.table("~/Data Science/GACD_Assignment/UCI HAR Dataset/train/subject_train.txt")
  
  ## Read test data set
  x_test <- read.table("~/Data Science/GACD_Assignment/UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("~/Data Science/GACD_Assignment/UCI HAR Dataset/test/y_test.txt")
  subject_test <- read.table("~/Data Science/GACD_Assignment/UCI HAR Dataset/test/subject_test.txt")
  
  ## Read feature and activity labels
  features <- read.table("~/Data Science/GACD_Assignment/UCI HAR Dataset/features.txt")
  activity_labels <- read.table("~/Data Science/GACD_Assignment/UCI HAR Dataset/activity_labels.txt")
  
  ## Assign column names to data sets
  colnames(x_train) <- features[,2] 
  colnames(y_train) <-"activityId"
  colnames(subject_train) <- "subjectId"
  
  colnames(x_test) <- features[,2] 
  colnames(y_test) <- "activityId"
  colnames(subject_test) <- "subjectId"
  
  colnames(activity_labels) <- c('activityId','activityType')
  
  ## Merging train and test data set
  x_train <- cbind(y_train, subject_train, x_train)
  x_test <- cbind(y_test, subject_test, x_test)
  x_data <- rbind(x_train, x_test)
  
  # Extracting Meand and Standard deviation measurement for each observation
  
  ## Finding activityId, subjectid, mean and standard deviation columns
  x_data_col_index <- (grepl("activityId" , colnames(x_data)) | 
                     grepl("subjectId" , colnames(x_data)) | 
                     grepl(".mean\\(\\)." , colnames(x_data)) | 
                     grepl(".std\\(\\)." , colnames(x_data)) 
  )
  
  ## Subseting required columns from x_data
  x_data_mean_std <- subset(x_data, select = x_data_col_index)
  
  # Using activity names
  x_data_mean_std_activity_name <- merge(activity_labels,x_data_mean_std, 
                                   by='activityId')
  

  ## Using descriptive names for columns
  ###prefix t is replaced by time
  ###Acc is replaced by Accelerometer
  ###Gyro is replaced by Gyroscope
  ###prefix f is replaced by frequency
  ###Mag is replaced by Magnitude
  ###BodyBody is replaced by Body
  
  names(x_data_mean_std_activity_name)<-gsub("^t", "time", names(x_data_mean_std_activity_name))
  names(x_data_mean_std_activity_name)<-gsub("^f", "frequency", names(x_data_mean_std_activity_name))
  names(x_data_mean_std_activity_name)<-gsub("Acc", "Accelerometer", names(x_data_mean_std_activity_name))
  names(x_data_mean_std_activity_name)<-gsub("Gyro", "Gyroscope", names(x_data_mean_std_activity_name))
  names(x_data_mean_std_activity_name)<-gsub("Mag", "Magnitude", names(x_data_mean_std_activity_name))
  names(x_data_mean_std_activity_name)<-gsub("BodyBody", "Body", names(x_data_mean_std_activity_name))
  
  #Creating a second, independent tidy data set with the average of each variable for each activity and each subject:
  
  ##Making second tidy data set
  another_x_data_mean_std <- aggregate(. ~subjectId + activityId, x_data_mean_std_activity_name, mean)
  another_x_data_mean_std <- another_x_data_mean_std[order(another_x_data_mean_std$subjectId, another_x_data_mean_std$activityId),]
  

  ## Writing in tidy dataset in file
  write.table(another_x_data_mean_std, "~/Data Science/GACD_Assignment/another_tidy_dataset.txt", row.name=FALSE)


