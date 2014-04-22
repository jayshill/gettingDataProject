# Load the training and test sets, assuming the archive is already unziped
# in the working directory. Also load the corresponding subject and activity
# data files.
trainData <- read.table("UCI HAR Dataset//train//X_train.txt")
trainSubject <- read.table("UCI HAR Dataset//train//subject_train.txt")
trainActivity <- read.table("UCI HAR Dataset//train//y_train.txt")
testData <- read.table("UCI HAR Dataset//test//X_test.txt")
testSubject <- read.table("UCI HAR Dataset//test//subject_test.txt")
testActivity <- read.table("UCI HAR Dataset//test//y_test.txt")

# Assign variable names.
colnames(trainSubject) <- "subject"
colnames(trainActivity) <- "activityNum"
colnames(testSubject) <- "subject"
colnames(testActivity) <- "activityNum"
featureNames <- read.table("UCI HAR Dataset//features.txt")
featureNames <- as.character(featureNames[,2])
colnames(trainData) <- featureNames
colnames(testData) <- featureNames

# Combine the Data, Subject, and Activity data frames.
train <- cbind(trainActivity, trainSubject, trainData)
test <- cbind(testActivity, testSubject, testData)

# Combine the train and test data sets into one
fullset <- rbind(train, test)

# Replace activity number codes with names of the activities
activities <- read.table("UCI HAR Dataset//activity_labels.txt")
names(activities) <- c("activityNum", "activity")
fullset <- merge(x=activities, y=fullset, by="activityNum", all=T)

# Extract only the activity, subject, and mean & standard deviation variables.
colsMeanSTD <- grepl(pattern="subject|activity|mean|std", names(fullset))
trimmedset <- fullset[,colsMeanSTD]
trimmedset <- trimmedset[,-1]

# Average over each subject for each activity
for (act in trimmedset$activity) {
    for (subj in trimmedset$subject) {
        for (datacol in 3:dim(trimmedset)[2]) {
            print(act)
            print(subj)
            print(mean(trimmedset[,datacol]))
        }
        
    }
}