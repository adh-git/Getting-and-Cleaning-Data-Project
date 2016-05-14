##########################################################################################################

## Coursera Getting and Cleaning Data Course Project
## kjh
## May 10, 2016

# runAnalysis.r 

# Purpose: To prepare a tidy dataset on the UCI HAR Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
# The following steps are performed from the raw data
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

# REQUIRED: dplyr and setting working directory to the location where the UCI HAR Dataset was unzipped
##########################################################################################################

# Clean up workspace
rm(list=ls())

# Load dplyr
library(dplyr)

# set working directory to the location where the UCI HAR Dataset was unzipped
# eg. setwd('/Users/YourName/Documents//UCI HAR Dataset');

##########################################################################################################
# 1. Merge the training and the test sets to create one data set.

# Load feature variable names and activity labels
features <- read.table("./features.txt")
activityValues <- read.table("./activity_labels.txt")

# Read in testing data and bind together column-wise
testSubjects    <- read.table("./test/Subject_test.txt")
testActivities  <- read.table("./test/Y_test.txt")
testFeatures    <- read.table("./test/X_test.txt")
test            <- cbind(testSubjects, testActivities, testFeatures)

# Add column names 
names(testSubjects)   <- "subject"
names(testActivities) <- "activity"
names(testFeatures)   <- features[,2]

# Bind testing data together column-wise
test <- cbind(testSubjects, testActivities, testFeatures)

# Read in training data and bind together column-wise
trainSubjects   <- read.table("./train/Subject_train.txt")
trainActivities <- read.table("./train/Y_train.txt")
trainFeatures   <- read.table("./train/X_train.txt")

# Add column names 
names(trainSubjects)   <- "subject"
names(trainActivities) <- "activity"
names(trainFeatures)   <- features[,2]

# Bind training data together column-wise
train <- cbind(trainSubjects, trainActivities, trainFeatures)

# Merge the training and the testing sets
data <- rbind(test,train)
colNames = names(data)

##########################################################################################################
# 2. Extract only the measurements on the mean and standard deviation for each measurement.

# Determine the indices for all columns features with 
# values giving the mean and standard deviation for each measurement
# Include subject and activity column indices as well
colIndex <- grep("subject|activity|mean\\(\\)|std\\(\\)", colNames)

# Extract desired columns
data <- data[,colIndex]
colNames = colnames(data)

##########################################################################################################
# 3. Use descriptive activity names to name the activities in the data set

# Relabel activities from numbers to descriptive text. Eg "1" --> "laying" 
data$activity <- plyr::mapvalues(data$activity, 
                           from = activityValues[,1], 
                           to = tolower(activityValues[,2]))

  
##########################################################################################################
# 4. Appropriately label the data set with descriptive variable names. 

# Clean up feature names
colNames <- gsub('-mean', 'Mean', colNames) 
colNames <- gsub('-std', 'Std', colNames) 
colNames <- gsub('[-()]', '', colNames) 
colNames <- gsub('BodyBody','Body',colNames)
colNames <- gsub('^(t)','time',colNames)
colNames <- gsub('^(f)','freq',colNames)
colNames <- gsub('Mag','Magnitude',colNames)

names(data) <- colNames

##########################################################################################################
# Convert activity and subject variables to factor variables-- just good practice
data$activity <- as.factor(data$activity)
data$subject <- as.factor(data$subject)

##########################################################################################################
# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

dataTidy <- data %>% 
  group_by(subject,activity) %>%
  summarise_each(funs(mean))

dataTidy = as.data.frame(dataTidy)

# Export the tidyData set 
write.table(dataTidy, 'tidy_data.txt',row.names=TRUE,sep='\t')


