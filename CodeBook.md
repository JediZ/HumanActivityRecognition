The code book for Human Activity Recognition dataset
==================

# The Variables
## Variables explained:
For each record in the dataset it is provided: 
- subject: Type: int; Value: 1-30. An identifier of the subject who carried out the experiment. See subject_train.txt and subject_test.txt
- activity: Type: factor; Levels: "LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS". The activity label. See activity_labels.txt
- The rest 79 fetures: Type: Numeric. See features.txt and features_info.txt for detailed description. A list of these features are listed below.

        "tBodyAcc.mean.X"               "tBodyAcc.mean.Y"              
        "tBodyAcc.mean.Z"               "tGravityAcc.mean.X"           
        "tGravityAcc.mean.Y"            "tGravityAcc.mean.Z"           
        "tBodyAccJerk.mean.X"           "tBodyAccJerk.mean.Y"          
        "tBodyAccJerk.mean.Z"           "tBodyGyro.mean.X"             
        "tBodyGyro.mean.Y"              "tBodyGyro.mean.Z"             
        "tBodyGyroJerk.mean.X"          "tBodyGyroJerk.mean.Y"         
        "tBodyGyroJerk.mean.Z"          "tBodyAccMag.mean"             
        "tGravityAccMag.mean"           "tBodyAccJerkMag.mean"         
        "tBodyGyroMag.mean"             "tBodyGyroJerkMag.mean"        
        "fBodyAcc.mean.X"               "fBodyAcc.mean.Y"              
        "fBodyAcc.mean.Z"               "fBodyAcc.meanFreq.X"          
        "fBodyAcc.meanFreq.Y"           "fBodyAcc.meanFreq.Z"          
        "fBodyAccJerk.mean.X"           "fBodyAccJerk.mean.Y"          
        "fBodyAccJerk.mean.Z"           "fBodyAccJerk.meanFreq.X"      
        "fBodyAccJerk.meanFreq.Y"       "fBodyAccJerk.meanFreq.Z"      
        "fBodyGyro.mean.X"              "fBodyGyro.mean.Y"             
        "fBodyGyro.mean.Z"              "fBodyGyro.meanFreq.X"         
        "fBodyGyro.meanFreq.Y"          "fBodyGyro.meanFreq.Z"         
        "fBodyAccMag.mean"              "fBodyAccMag.meanFreq"         
        "fBodyBodyAccJerkMag.mean"      "fBodyBodyAccJerkMag.meanFreq" 
        "fBodyBodyGyroMag.mean"         "fBodyBodyGyroMag.meanFreq"    
        "fBodyBodyGyroJerkMag.mean"     "fBodyBodyGyroJerkMag.meanFreq"
        "tBodyAcc.std.X"                "tBodyAcc.std.Y"               
        "tBodyAcc.std.Z"                "tGravityAcc.std.X"            
        "tGravityAcc.std.Y"             "tGravityAcc.std.Z"            
        "tBodyAccJerk.std.X"            "tBodyAccJerk.std.Y"           
        "tBodyAccJerk.std.Z"            "tBodyGyro.std.X"              
        "tBodyGyro.std.Y"               "tBodyGyro.std.Z"              
        "tBodyGyroJerk.std.X"           "tBodyGyroJerk.std.Y"          
        "tBodyGyroJerk.std.Z"           "tBodyAccMag.std"              
        "tGravityAccMag.std"            "tBodyAccJerkMag.std"          
        "tBodyGyroMag.std"              "tBodyGyroJerkMag.std"         
        "fBodyAcc.std.X"                "fBodyAcc.std.Y"               
        "fBodyAcc.std.Z"                "fBodyAccJerk.std.X"           
        "fBodyAccJerk.std.Y"            "fBodyAccJerk.std.Z"           
        "fBodyGyro.std.X"               "fBodyGyro.std.Y"              
        "fBodyGyro.std.Z"               "fBodyAccMag.std"              
        "fBodyBodyAccJerkMag.std"       "fBodyBodyGyroMag.std"         
        "fBodyBodyGyroJerkMag.std"  
    

# the data
Data was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Check the README.txt file for further details about this dataset.

## tidydata.csv:
This dataset was generated by subsetting the above features of interest from the merged dataset from original training and test sets.

## tidydata_avg.csv:
This dataset was generated by taking average of each subject and each activity using the dataset saved in tidydata.csv.

# data cleaning up 
Data is cleaned up using run_analysis.R

This script does the following:
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive activity names.
 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

this script generate two cleaned up datasets, which are saved in csv files:
- tidydata.csv.txt : the dataset containing measurements with features containing mean or std
- tidydata_avg.csv.txt: the dataset containing data averaged by each subject and activity
Please use read.csv to load the data. 
(the txt extension is used for coursera uploading requirement, it does not interfere with read.csv)




