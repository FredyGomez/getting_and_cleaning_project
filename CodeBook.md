# Original data:

source
description

# Data Transformation Steps


Training and Test data sets are treated independenly initially. 

READ STAGE

For both data sets, the main data is the X values, which are read, together with the other data sets, so we have:

X_test/training.txt
subect_test/training.txt
y_test/traning.txt

other common files:
features,txt

The script will read these data sets into 2 different data frames, performed by functions readTestData() and readTrainingData()

Each of these functions will:

1)
Read the file from the proper folder

2)
With the features.txt file we also get the proper column names

2)
Each of the data frames will be reduced to consider only the columns that are going to be used, using the grep function for thus

3)
The Y data and Subject data is added to the X data at the end of the function.


MERGE and OTHER OPERATIONS STAGE

In this stage, both data sets will be merged to create one data set.

This is done using the function getMergedData()

This function, at the same time, adds the activity descriptive information to the single data set.

After thatt, the file is aggregated using activity ID, name and Subject ID as ID variables, and using mean for the aggregator function

The result of this aggregation is stored in a melted data frame


FILE EXPORT

After the merging and reshaping functions, the resultant tidy data frame is expoted into an external file in the working dorectory.


# Variable Descriptions


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are:


Mean: Mean value

StD: Standard deviation


##Data Columns

ActivityName: Activity being performed
SubjectID: ID indicating the subject from whom data was collected
tBodyAccMeanX

tBodyAccMeanY

tBodyAccMeanZ

tBodyAccStDX

tBodyAccStDY

tBodyAccStDZ

tGravityAccMeanX

tGravityAccMeanY

tGravityAccMeanZ

tGravityAccStDX

tGravityAccStDY

tGravityAccStDZ

tBodyAccJerkMeanX

tBodyAccJerkMeanY

tBodyAccJerkMeanZ

tBodyAccJerkStDX

tBodyAccJerkStDY

tBodyAccJerkStDZ

tBodyGyroMeanX

tBodyGyroMeanY

tBodyGyroMeanZ

tBodyGyroStDX

tBodyGyroStDY

tBodyGyroStDZ

tBodyGyroJerkMeanX

tBodyGyroJerkMeanY

tBodyGyroJerkMeanZ

tBodyGyroJerkStDX

tBodyGyroJerkStDY

tBodyGyroJerkStDZ

tBodyAccMagMean

tBodyAccMagStD

tGravityAccMagMean

tGravityAccMagStD

tBodyAccJerkMagMean

tBodyAccJerkMagStD

tBodyGyroMagMean

tBodyGyroMagStD

tBodyGyroJerkMagMean

tBodyGyroJerkMagStD

fBodyAccMeanX

fBodyAccMeanY

fBodyAccMeanZ

fBodyAccStDX

fBodyAccStDY

fBodyAccStDZ

fBodyAccJerkMeanX

fBodyAccJerkMeanY

fBodyAccJerkMeanZ

fBodyAccJerkStDX

fBodyAccJerkStDY

fBodyAccJerkStDZ

fBodyGyroMeanX

fBodyGyroMeanY

fBodyGyroMeanZ

fBodyGyroStDX

fBodyGyroStDY

fBodyGyroStDZ

fBodyAccMagMean

fBodyAccMagStD

fBodyBodyAccJerkMagMean

fBodyBodyAccJerkMagStD

fBodyBodyGyroMagMean

fBodyBodyGyroMagStD

fBodyBodyGyroJerkMagMean

fBodyBodyGyroJerkMagStD