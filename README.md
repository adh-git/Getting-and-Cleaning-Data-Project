# Getting-and-Cleaning-Data-Project
A repo for the final project for Coursera's Getting and Cleaning Data class.

## Purpose
To prepare a tidy dataset on the UCI HAR Dataset downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Required
dplyr must be installed.

You must set working directory to the location where the UCI HAR Dataset was unzipped 
(eg. /User/YourName/Documents/UCI HAR Dataset).

## Description of Code

 0. Clean working space, load dplyr, set working directory and load in data
 1. Merge the training and the test sets to create one data set.
     - Load feature variable names and activity labels
     - Read in testing data and bind together column-wise; add column names; bind testing subject, activity and feature data together column-wise
     - Same for training data
     - Bind training and testing together row-wise
 2. Extract only the measurements on the mean and standard deviation for each measurement. (Note that I interpreted this specification to mean extracting from the feature set obtained from X_test.txt and X_train.txt only those features that are the mean and standard deviation of the derived signals. In particular, the meanFreq features were not extracted.)
     - Determine the indices for all columns features with values giving the mean and standard deviation for each measurement. Include subject and activity column indices as well
     - Use index to extract desired data set
 3. Use descriptive activity names to name the activities in the data set
     - Relabel activities from numbers to descriptive text. Eg "1" --> "laying" 
 4. Appropriately label the data set with descriptive activity names.
    - Clean up feature names by removing dashes and parenthesis
    - Make names clearer (eg. t --> time, f --> freq, Mag --> Magnitude)
 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. (Note that I interpreted this specification to mean that only the average for each subject and activity was desired so that the 1022 by 68 dataset collapsed into a 180 by 68 dataset, where 180 = 30 subjects * 6 activities).
    - Use dplyr's group_by and summerise to average each variable over activity




