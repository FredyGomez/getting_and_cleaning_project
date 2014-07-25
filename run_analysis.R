# Script name: run_analysis.R
# Instructions: allocate the script in the same foler of the data after uncompress it
#
# 
#
#

# read test data set, in a folder named "test", and data file names suffixed with "test"
# it will read all the necessary files in the test folder and combine them to generate a single test data set
readTestData <- function() {
    #Activity data read
    y_data <- read.table("test/y_test.txt", header=F, col.names=c("ActivityID"))
    
    #Subject data read
    subject_data <- read.table("test/subject_test.txt", header=F, col.names=c("SubjectID"))
    
    # read the column names
    data_cols <- read.table("features.txt", header=F, as.is=T, col.names=c("MeasureID", "MeasureName"))
    
    # read the X data file
    testdata <- read.table("test/X_test.txt", header=F, col.names=data_cols$MeasureName)

    # and subset only the necessary column names for the data to be managed
    # using pattern matching with the grep function and sending the output to other variable
    subset_data_cols <- grep(".*mean\\(\\)|.*std\\(\\)", data_cols$MeasureName)
        
    # subset the data to facilitate the merging making use of less memory in that stage
    testdata <- testdata[,subset_data_cols]
    
    # append the activity id and subject id columns previously read to the X_data set
    testdata$ActivityID <- y_data$ActivityID
    testdata$SubjectID <- subject_data$SubjectID
    
    # return the data
    testdata

}


# read train data set, in a folder named "train", and data file names suffixed with "train"
# it will read all the necessary files in the train folder and combine them to generate a single train data set

readTrainData <- function() {
    #Activity data read
    y_data <- read.table("train/y_train.txt", header=F, col.names=c("ActivityID"))
    
    #Subject data read
    subject_data <- read.table("train/subject_train.txt", header=F, col.names=c("SubjectID"))
    
    # read the column names
    data_cols <- read.table("features.txt", header=F, as.is=T, col.names=c("MeasureID", "MeasureName"))
    
    # read the X data file
    traindata <- read.table("train/X_train.txt", header=F, col.names=data_cols$MeasureName)

    # and subset only the necessary column names for the data to be managed
    # using pattern matching with the grep function and sending the output to other variable
    subset_data_cols <- grep(".*mean\\(\\)|.*std\\(\\)", data_cols$MeasureName)
        
    # subset the data to facilitate the merging making use of less memory in that stage
    traindata <- traindata[,subset_data_cols]
    
    # append the activity id and subject id columns
    traindata$ActivityID <- y_data$ActivityID
    traindata$SubjectID <- subject_data$SubjectID
    
    # return the data
    traindata

}


# Merge the data, add the necessary labels and prepare it to perform the necessary calculations
getMergedData <- function() {
   
    #merge the data sets
    mergeddata <- rbind(readTestData(), readTrainData())
    # this part to name better the columns so it is easier to locate them (capitalize the mean and std to Mean and StD)
    cnames <- colnames(mergeddata)
    cnames <- gsub("\\.+mean\\.+", cnames, replacement="Mean")
    cnames <- gsub("\\.+std\\.+",  cnames, replacement="StD")
    colnames(mergeddata) <- cnames
   
    # after mergin the data, extend it with the activity descriptors, mergin the match activity labels with the already merged data
    activity_labels <- read.table("activity_labels.txt", header=F, as.is=T, col.names=c("ActivityID", "ActivityName"))
    activity_labels$ActivityName <- as.factor(activity_labels$ActivityName)
    data_labeled <- merge(mergeddata, activity_labels)
    data_labeled
}


# Create a tidy data set that has the average of each variable for each activity and each subject.
getTidyData <- function(merged_data) {
    library(reshape2)
    
    # melt the dataset
    id_vars = c("ActivityID", "ActivityName", "SubjectID")
    measure_vars = setdiff(colnames(merged_data), id_vars)
    melted_data <- melt(merged_data, id=id_vars, measure.vars=measure_vars)
    
    # recast 
    dcast(melted_data, ActivityName + SubjectID ~ variable, mean)    
}

# Create the tidy data set and save it on to the named file
createTidyDataFile <- function(fname) {
    tidy_data <- getTidyData(getMergedData())
    write.table(tidy_data, fname)
}

print("Starting process.")
createTidyDataFile("tidy.txt")
print("Process Finished.")