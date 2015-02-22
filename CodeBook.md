#Codebook

## Background
The following is an extract of the original data source at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data."

The aim of this project is to clean up the data and provide a summary of specific variables (means and stds) for each trial/user/activity combination.

## Raw Data 
The data available for analysis in the UCI HAR Dataset (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) includes training and testing samples for each subject, activity and trial combination. For each trial, a combined 561 different data points were recorded.

## Processed Data
The final tidy data set ("tidyDataSet.txt") contains the following variables:

"Test": Coded as a factor variable denoting whether the data came from testing (Test=1) or training (Test=0)

"SubjID": The subject ID as an integer

"Activity": The descriptive name of the activity being carried out, this is a factor variable as per the 6 activities used in the experimental method (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

The rest of the features are averages of selected variables over for each user and activity. The selected variables are means and standard deviations from the original dataset as prescribed by the assignment. Any variable with "mean" or "std" in the original dataset was included for this summary:

The names for the final tidy data set should be sufficiently descriptive, but the following guide may help the reader:

"Avg" : Averages over the sample for each user and each activity
"time" or "freq" : Whether the measure is over the time or frequency domain
"Body"" or "Gravity" : Whether the data indicates body or gravity acceration signals
"Mean" or "StandardDev" or "MeanFreq": Whether the value is a mean or standard deviation or mean freq (weighted average of the frequency components to obtain a mean frequency)
"along_?axis": What axis the data belongs to

### Feature averages

"Avg_time_Body_Acceleration_Mean()_along_Xaxis"
"Avg_time_Body_Acceleration_Mean()_along_Yaxis"
"Avg_time_Body_Acceleration_Mean()_along_Zaxis"
"Avg_time_Body_Acceleration_StandardDev()_along_Xaxis"
"Avg_time_Body_Acceleration_StandardDev()_along_Yaxis"
"Avg_time_Body_Acceleration_StandardDev()_along_Zaxis"
"Avg_time_Gravity_Acceleration_Mean()_along_Xaxis"
"Avg_time_Gravity_Acceleration_Mean()_along_Yaxis"
"Avg_time_Gravity_Acceleration_Mean()_along_Zaxis"
"Avg_time_Gravity_Acceleration_StandardDev()_along_Xaxis"
"Avg_time_Gravity_Acceleration_StandardDev()_along_Yaxis"
"Avg_time_Gravity_Acceleration_StandardDev()_along_Zaxis"
"Avg_time_Body_AccelerationJerk_Mean()_along_Xaxis"
"Avg_time_Body_AccelerationJerk_Mean()_along_Yaxis"
"Avg_time_Body_AccelerationJerk_Mean()_along_Zaxis"
"Avg_time_Body_AccelerationJerk_StandardDev()_along_Xaxis"
"Avg_time_Body_AccelerationJerk_StandardDev()_along_Yaxis"
"Avg_time_Body_AccelerationJerk_StandardDev()_along_Zaxis"
"Avg_time_BodyGyro_Mean()_along_Xaxis"
"Avg_time_BodyGyro_Mean()_along_Yaxis"
"Avg_time_BodyGyro_Mean()_along_Zaxis"
"Avg_time_BodyGyro_StandardDev()_along_Xaxis"
"Avg_time_BodyGyro_StandardDev()_along_Yaxis"
"Avg_time_BodyGyro_StandardDev()_along_Zaxis"
"Avg_time_BodyGyroJerk_Mean()_along_Xaxis"
"Avg_time_BodyGyroJerk_Mean()_along_Yaxis"
"Avg_time_BodyGyroJerk_Mean()_along_Zaxis"
"Avg_time_BodyGyroJerk_StandardDev()_along_Xaxis"
"Avg_time_BodyGyroJerk_StandardDev()_along_Yaxis"
"Avg_time_BodyGyroJerk_StandardDev()_along_Zaxis"
"Avg_time_Body_Acceleration_Magnitude_Mean()"
"Avg_time_Body_Acceleration_Magnitude_StandardDev()"
"Avg_time_Gravity_Acceleration_Magnitude_Mean()"
"Avg_time_Gravity_Acceleration_Magnitude_StandardDev()"
"Avg_time_Body_AccelerationJerk_Magnitude_Mean()"
"Avg_time_Body_AccelerationJerk_Magnitude_StandardDev()"
"Avg_time_BodyGyro_Magnitude_Mean()"
"Avg_time_BodyGyro_Magnitude_StandardDev()"
"Avg_time_BodyGyroJerk_Magnitude_Mean()"
"Avg_time_BodyGyroJerk_Magnitude_StandardDev()"
"Avg_freq_Body_Acceleration_Mean()_along_Xaxis"
"Avg_freq_Body_Acceleration_Mean()_along_Yaxis"
"Avg_freq_Body_Acceleration_Mean()_along_Zaxis"
"Avg_freq_Body_Acceleration_StandardDev()_along_Xaxis"
"Avg_freq_Body_Acceleration_StandardDev()_along_Yaxis"
"Avg_freq_Body_Acceleration_StandardDev()_along_Zaxis"
"Avg_freq_Body_Acceleration_MeanFreq()_along_Xaxis"
"Avg_freq_Body_Acceleration_MeanFreq()_along_Yaxis"
"Avg_freq_Body_Acceleration_MeanFreq()_along_Zaxis"
"Avg_freq_Body_AccelerationJerk_Mean()_along_Xaxis"
"Avg_freq_Body_AccelerationJerk_Mean()_along_Yaxis"
"Avg_freq_Body_AccelerationJerk_Mean()_along_Zaxis"
"Avg_freq_Body_AccelerationJerk_StandardDev()_along_Xaxis"
"Avg_freq_Body_AccelerationJerk_StandardDev()_along_Yaxis"
"Avg_freq_Body_AccelerationJerk_StandardDev()_along_Zaxis"
"Avg_freq_Body_AccelerationJerk_MeanFreq()_along_Xaxis"
"Avg_freq_Body_AccelerationJerk_MeanFreq()_along_Yaxis"
"Avg_freq_Body_AccelerationJerk_MeanFreq()_along_Zaxis"
"Avg_freq_BodyGyro_Mean()_along_Xaxis"
"Avg_freq_BodyGyro_Mean()_along_Yaxis"
"Avg_freq_BodyGyro_Mean()_along_Zaxis"
"Avg_freq_BodyGyro_StandardDev()_along_Xaxis"
"Avg_freq_BodyGyro_StandardDev()_along_Yaxis"
"Avg_freq_BodyGyro_StandardDev()_along_Zaxis"
"Avg_freq_BodyGyro_MeanFreq()_along_Xaxis"
"Avg_freq_BodyGyro_MeanFreq()_along_Yaxis"
"Avg_freq_BodyGyro_MeanFreq()_along_Zaxis"
"Avg_freq_Body_Acceleration_Magnitude_Mean()"
"Avg_freq_Body_Acceleration_Magnitude_StandardDev()"
"Avg_freq_Body_Acceleration_Magnitude_MeanFreq()"
"Avg_freq_BodyBody_AccelerationJerk_Magnitude_Mean()"
"Avg_freq_BodyBody_AccelerationJerk_Magnitude_StandardDev()"
"Avg_freq_BodyBody_AccelerationJerk_Magnitude_MeanFreq()"
"Avg_freq_BodyBodyGyro_Magnitude_Mean()"
"Avg_freq_BodyBodyGyro_Magnitude_StandardDev()"
"Avg_freq_BodyBodyGyro_Magnitude_MeanFreq()"
"Avg_freq_BodyBodyGyroJerk_Magnitude_Mean()"
"Avg_freq_BodyBodyGyroJerk_Magnitude_StandardDev()"
"Avg_freq_BodyBodyGyroJerk_Magnitude_MeanFreq()"
