---
title: "Codebook for Getting and Cleaning Data Project"
author: "kjh"
date: "May 10, 2016"
---

## Project Description
This project demonstrates the collection and cleaning of data to produce a tidy data set. The original Human Activity Recognition (HAR) database was collected from the smartphone accelerometers and gyroscopes of 30 volunteers during 6 levels of activity. 

## Data Description

### Raw Data
A full description of the raw data used in this project can be found in
in [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), as well as the README.txt and features_info.txt files contained in the zip file of the raw data. 

The raw data itself can be found [here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


Summary: The HAR database contains 10299 records of 561 features derived from the signals of smartphone accelerometers and gyroscopes. The data used in this project is found in 10 text files

  + features.txt: contains feature variable names
  + activity_labels.txt: contains the lookup table for the six activities (eg. 1 --> WALKING)
  + X_test/train.txt: contains 561 features for the testing and training data sets
  + subject_test/train.txt: contains the subject numbers (1-30) for each record in X_test/train.txt
  + y_test/train.txt: contains the activity numbers (1-6) for each record in X_test/train.txt
  + Note that the data in the InertialSignals directories was not used for this project.

The features were dervived from the accelerameter and gyroscope signals as follows:

  + The raw accelerameter signal was separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ-- total of 6 signals).
  + The gyroscopic signal (yBodyGyro-XYZ-- total of 3 signals).
  + The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ-- total of 6 signals).
  + The magnitude of the three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag-- total of 5)
  + A Fast Fourier Transform (FFT) was applied to produce the frequency domain signals (fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag-- total of 13).
  + 17 summery operations, including taking the mean and standard deviation, were performed on the derived signals to produce 17*(6+3+6+5+13) = 561 features. Only the mean and standard deviation are of interest in this project.

### Tidy Data

Only 66 of the orignal 561 features were extracted from the HAR database-- those giving the mean or standard deviation of each measurement. These features were averaged over activity for each subject.

Dimensions of tidy_data.txt: 68 columns and 180 rows.

Rows: Each of the 30 subjects has feature values for 6 activities (30*6 = 180 rows).

Columns:

* Column  1: subject--   A factor variable representing the 30 human volunteers with levels 1-30
* Column  2: activity--  A factor variable representing the 6 types of activities
* Columns 3 - 68--       Numeric feature variables, which are the mean and standard deviation feature variables averaged over subject and activity. Note that meanFreq variables are not included.

#### Units
In the time domain, Acc and AccJerk variables are in standard gravity units 'g', while Gyro and GyroJerk variables are in radians/sec.

#### List of Variables
timeBodyAccMeanX             
timeBodyAccMeanY              
timeBodyAccMeanZ              
timeBodyAccStdX              
timeBodyAccStdY               
timeBodyAccStdZ               
timeGravityAccMeanX          
timeGravityAccMeanY           
timeGravityAccMeanZ           
timeGravityAccStdX           
timeGravityAccStdY            
timeGravityAccStdZ            
timeBodyAccJerkMeanX         
timeBodyAccJerkMeanY          
timeBodyAccJerkMeanZ          
timeBodyAccJerkStdX          
timeBodyAccJerkStdY           
timeBodyAccJerkStdZ           
timeBodyGyroMeanX            
timeBodyGyroMeanY             
timeBodyGyroMeanZ             
timeBodyGyroStdX             
timeBodyGyroStdY              
timeBodyGyroStdZ              
timeBodyGyroJerkMeanX        
timeBodyGyroJerkMeanY         
timeBodyGyroJerkMeanZ         
timeBodyGyroJerkStdX         
timeBodyGyroJerkStdY          
timeBodyGyroJerkStdZ          
timeBodyAccMagnitudeMean     
timeBodyAccMagnitudeStd       
timeGravityAccMagnitudeMean   
timeGravityAccMagnitudeStd   
timeBodyAccJerkMagnitudeMean  
timeBodyAccJerkMagnitudeStd   
timeBodyGyroMagnitudeMean    
timeBodyGyroMagnitudeStd      
timeBodyGyroJerkMagnitudeMean  
timeBodyGyroJerkMagnitudeStd  
freqBodyAccMeanX              
freqBodyAccMeanY              
freqBodyAccMeanZ             
freqBodyAccStdX               
freqBodyAccStdY               
freqBodyAccStdZ              
freqBodyAccJerkMeanX          
freqBodyAccJerkMeanY          
freqBodyAccJerkMeanZ         
freqBodyAccJerkStdX           
freqBodyAccJerkStdY           
freqBodyAccJerkStdZ          
freqBodyGyroMeanX             
freqBodyGyroMeanY             
freqBodyGyroMeanZ            
freqBodyGyroStdX              
freqBodyGyroStdY              
freqBodyGyroStdZ             
freqBodyAccMagnitudeMean      
freqBodyAccMagnitudeStd       
freqBodyAccJerkMagnitudeMean   
freqBodyAccJerkMagnitudeStd   
freqBodyGyroMagnitudeMean     
freqBodyGyroMagnitudeStd     
freqBodyGyroJerkMagnitudeMean   
freqBodyGyroJerkMagnitudeStd   

