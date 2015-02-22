##You should create one R script called run_analysis.R that does the following. 
## Task 1: Merges the training and the test sets to create one data set.
## Task 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
## Task 3: Uses descriptive activity names to name the activities in the data set
## Task 4: Appropriately labels the data set with descriptive variable names. 
## Task 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


##Task 1: Merges the training and the test sets to create one data set.

#Set the environment
library(data.table)

# Start with the Test Dataset
# Get all subjects
SubjectID <- read.table("./test/subject_test.txt")

# Get all Activities
Activity <- read.table("./test/y_test.txt")

# Get the Main Feature Vectors
Features <- read.table("./test/X_test.txt")

#Get the Feature Names and coerce to strings the unique names are the index numbers, not the actual strings.
FeatureNames <- read.table("./features.txt")
FeatureNamesStrings <- as.character(FeatureNames[,2])
# Remove the commas in the names to make things less confusing
FeatureNamesStrings <- sub(",",".",FeatureNamesStrings)
FeatureNamesStrings <- c("Test", "SubjID", "Activity", FeatureNamesStrings)
#Start to build the Data Table

# First add the feature vectors
FeaturesDT = data.table(Features)

# Now add the Subject and the Activities labels
FeaturesDT[,SubjID:=SubjectID]
FeaturesDT[,Activity:=Activity]

# Now create the variable for Test vs Train. It will be binary, Test = 1, Train = 0
Test <- rep(1,length(SubjectID$V1))

# Now add to this column to the data table
FeaturesDT[,Test:=Test]

#Reorder to bring the Test, SubjectID and Activity columns to the start where they are easier to see
setcolorder(FeaturesDT, c(564,562,563,1:561))

# Now continue with the Train Data Set
# Get all subjects
TrainSubjectID <- read.table("./train/subject_train.txt")

# Get all Activities
TrainActivity <- read.table("./train/y_train.txt")

# Get the Main Feature Vectors
TrainFeatures <- read.table("./train/X_train.txt")

# First add the feature vectors
TrainFeaturesDT = data.table(TrainFeatures)

# Now add the Subject and the Activities labels
TrainFeaturesDT[,SubjID:=TrainSubjectID]
TrainFeaturesDT[,Activity:=TrainActivity]

# Now create the variable for Test vs Train. It will be binary, Test = 1, Train = 0
Train <- rep(0,length(TrainSubjectID$V1))

# Now add to this column to the data table
TrainFeaturesDT[,Test:=Train]

setcolorder(TrainFeaturesDT, c(564,562,563,1:561))

# Now we should be ready to put the tables together

AllDataDT <- rbind(FeaturesDT, TrainFeaturesDT, use.names=TRUE)


## Task 4: Appropriately labels the data set with descriptive variable names. 

## Name these
setnames(AllDataDT,FeatureNamesStrings)


## Task 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

## Find all the mean and std columns
meanstdCols <- c(which(grepl("mean()", colnames(AllDataDT))), which(grepl("std()", colnames(AllDataDT))))

## Add the first three columns again
meanstdCols <- c(1,2,3,meanstdCols)

## order them
meanstdCols <- sort(meanstdCols)

## Pull out only those columns
ExtractedDT <- AllDataDT[,FeatureNamesStrings[meanstdCols], with=FALSE]

## Task 3: Uses descriptive activity names to name the activities in the data set

# Read in descriptive labels
ActivityLabels <- read.table("./activity_labels.txt")

# Use factoring to relabel the activity integers into words
ExtractedDT$Activity <- factor(ExtractedDT$Activity, labels=ActivityLabels$V2)

## Task 5: From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

TidyDT <- ExtractedDT[, lapply(.SD,mean), by=list(ExtractedDT$Test, ExtractedDT$SubjID, ExtractedDT$Activity)]

## Create better names
TidyDataNames <- names(ExtractedDT)

TidyDataNames <- gsub("-Y","along_Yaxis",TidyDataNames)
TidyDataNames <- gsub("-Z","along_Zaxis",TidyDataNames)
TidyDataNames <- gsub("-X","along_Xaxis",TidyDataNames)

TidyDataNames <- gsub("-","_",TidyDataNames)

TidyDataNames <- gsub("Acc","_Acceleration",TidyDataNames)
TidyDataNames <- gsub("Mag","_Magnitude",TidyDataNames)
TidyDataNames <- gsub("std()","StandardDev",TidyDataNames)
TidyDataNames <- gsub("mean()","Mean",TidyDataNames)
TidyDataNames <- gsub("()along","_along",TidyDataNames)

TidyDataNames <- gsub("tBody","Avg_time_Body", TidyDataNames)
TidyDataNames <- gsub("fBody","Avg_freq_Body", TidyDataNames)
TidyDataNames <- gsub("tGravity","Avg_time_Gravity", TidyDataNames)

setnames(TidyDT,TidyDataNames)

formatTidyDataSet <- format(TidyDT, digits=4, scientific=F, justify='right')

write.table(formatTidyDataSet, file='./tidyDataSet.txt',row.names=F, sep='\t', quote=F)
