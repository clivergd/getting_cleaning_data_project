require("data.table")
require("reshape2")

#Load data 
features <- read.table("~/Data Science/R/UCI HAR Dataset/features.txt",header=FALSE)[,2]
activityType <- read.table("~/Data Science/R/UCI HAR Dataset/activity_labels.txt",header=FALSE)[,2] 
subjectTrain <- read.table("~/Data Science/R/UCI HAR Dataset/train/subject_train.txt",header=FALSE) 
subjectTest <- read.table("~/Data Science/R/UCI HAR Dataset/test/subject_test.txt",header=FALSE)
xTrain <- read.table("~/Data Science/R/UCI HAR Dataset/train/x_train.txt",header=FALSE) 
yTrain <- read.table("~/Data Science/R/UCI HAR Dataset/train/y_train.txt",header=FALSE) 
xTest <- read.table("~/Data Science/R/UCI HAR Dataset/test/x_test.txt",header=FALSE) 
yTest <- read.table("~/Data Science/R/UCI HAR Dataset/test/y_test.txt",header=FALSE) 


names(xTest) <-features
names(xTrain) <- features

# Extract the measurements on the mean and standard deviation for each measurement.
extractFeatures <- grepl("mean|std", features)
xTest <- xTest[,extractFeatures]
xTrain <- xTrain[,extractFeatures]

# Load activity labels
yTest[,2] <- activityType [yTest[,1]]
names(yTest) = c("Activity_ID", "Activity_Label")
names(subjectTest) = "subject"

yTrain[,2] <- activityType [yTrain[,1]]
names(yTrain) <- c("Activity_ID", "Activity_Label")
names(subjectTrain) <- "subject"

# Bind and Merge test and train data
testData <- cbind(as.data.table(subjectTest), yTest, xTest)
trainData <- cbind(as.data.table(subjectTrain), yTrain, xTrain)

data <- rbind(testData, trainData)
idLabels <- c("subject", "Activity_ID", "Activity_Label")
dataLabels <- setdiff(colnames(data), idLabels)
meltData <- melt(data, id = idLabels, measure.vars = dataLabels)

# Apply mean dataset 
tidyData <- dcast(meltData, subject + Activity_Label ~ variable, mean)

# Create  tidy data table/file
write.table(tidyData, file = "./tidyData.txt")
