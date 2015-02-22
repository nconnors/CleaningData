
# Readme - Cleaning Data Assignment

## Before running the code

The code in the runAnalysis.R file creates a file called tidyDataSet.txt with the 
tidy data for the assigment as described in the Codebook.

To run correctly, the runAnalysis.R file should be located inside the unzipped folder for the UCI HAR Dataset.

NB: The data is available here (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

To run the file, use the following command:
source('~/[...]/UCI HAR Dataset/runAnalysis.R')
where [...] contains the filepath to the UCI HAR Dataset.

The working directory should also be set to the UCI HAR Dataset folder.

## What the code does

1. Merges the training and the test sets to create one data set. 
When the trial data and the test data are merged, and a new column, called Test, in used to denote whether the observation came from the test set (Test=1) or the training set (Test=0).
This dataset contains a column for Subject ID ("SubjID"), Activity ("Activity") and all of the associated features for each observation. The feature names are read in from "features.txt". They originally contain commas in the string, and these are removed for legibility and replaced with ".".
The resulting data table is called AllDataDT.

2. Extracts only the measurements on the mean and standard deviation for each measurement. The columns that contain measurements for mean and standard deviations contain the strings "mean" and "std" in the variable name. There were 82 variables that satisfied this rule. The resulting data table is called ExtractedDT.

3. Uses descriptive activity names to name the activities in the data set. The activity labels are read in from the file "activity_labels.txt", and the numbers in the "Activity" column in the dataset are replaced with the word descriptions from the file. This column now becomes a factor. The resulting data table is called ExtractedDT.

Steps 4 and 5 were swapped for expediency.

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
This is done with one line of code, where the dataset is grouped by user, activity and test/trial, and an average is taken for each of the variables. This reduces the dataset to 180 observations with 82 variables each. The result is in a data table called TidyDT, which contains the averages for all of the variables.

4. Appropriately labels the data set with descriptive variable names. 
In order to make the variable names more readable, the existing names are transformed as follows:
* "-Y" is changed to "along_Yaxis"
* "-Z" is changed to "along_Zaxis"
* "-X" is changed to "along_Xaxis"
* "-" is changed to "_"
* "Acc" is changed to "_Acceleration"
* "Mag" is changed to "_Magnitude"
* "std()" is changed to "StandardDev"
* "mean()" is changed to "Mean"
* "()along" is changed to "_along"
* "tBody" is changed to "Avg_time_Body"
* "fBody" is changed to "Avg_freq_Body"
* "tGravity" is changed to "Avg_time_Gravity"

The resulting data table is called TidyDT.

The final formatted data table is called formatTidyDataSet and is written to a text file called tidyDataSet.txt


