# Set the locations of the train and test data
dataDir <- "UCI HAR Dataset"
trainDataDir <- paste(dataDir,"train",sep="/")
testDataDir  <- paste(dataDir,"test",sep="/")
trainDataFile <- paste(trainDataDir,"X_train.txt",sep="/")
testDataFile  <- paste(testDataDir,"X_test.txt",sep="/")
trainActyFile <- paste(trainDataDir,"y_train.txt",sep="/")
testActyFile  <- paste(testDataDir,"y_test.txt",sep="/")
trainSubjFile <- paste(trainDataDir,"subject_train.txt",sep="/")
testSubjFile  <- paste(testDataDir,"subject_test.txt",sep="/")

# Read in and merge train and test data
trainData <- read.fwf(trainDataFile,widths=c(rep(16,561)))
testData  <- read.fwf(testDataFile, widths=c(rep(16,561)))
mData     <- rbind(trainData,testData)
trainActy <- read.table(trainActyFile,header=FALSE)
testActy  <- read.table(testActyFile, header=FALSE)
mActy     <- rbind(trainActy,testActy)
trainSubj <- read.table(trainSubjFile,header=FALSE)
testSubj  <- read.table(testSubjFile, header=FALSE)
mSubj     <- rbind(trainSubj,testSubj)

# Extract measurements on the mean and std deviation for each measurement
featureFile  <- paste(dataDir,"features.txt",sep="/")
features <- read.table(featureFile)
msCols <- grep("mean|std",features[,2])
subdata <- mData[,msCols]

# Use descriptive activity names to name the activities in the data set
labelFile  <- paste(dataDir,"activity_labels.txt",sep="/")
actyLabels <- read.table(labelFile)
actyLabels <- tolower(actyLabels[,2])
actyLabels <- gsub("_","",actyLabels)
actyLabels <- gsub("stairs","",actyLabels)

for (i in 1:nrow(mActy)) {
  id = mActy[i,1]
  mActy[i,2] = actyLabels[id]
}

# Add subject and activity columns to extracted data
subdata <- cbind(mSubj,mActy[,2],subdata)

# Labels the extracted data with descriptive variable names
msColNames <- grep("mean|std",features[,2],value=TRUE)
msColNames <- c("Subject","Activity",msColNames)
colnames(subdata) <- msColNames

# Tidy up the extracted data
#-Order the dataframe based on subject and activity
tidydata <- subdata[order(subdata$Subject,subdata$Activity),]

# Write tidied-up data to file
# write.fwf(x=tidydata, file="tidyData.txt")

#-Create a new dataframe for the average values
lists <- list(Subject=subdata$Subject,Activity=subdata$Activity)
agrdata <- aggregate(subdata[,3:ncol(subdata)],lists, mean)

# Write tidied-up data to file
write.table(x=agrdata, file="tidyData.txt", row.names = FALSE)


