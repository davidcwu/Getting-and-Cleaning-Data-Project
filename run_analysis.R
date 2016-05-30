
#The purpose of this project is to demonstrate your ability to collect, work with, 
#and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
#You will be graded by your peers on a series of yes/no questions related to the project. 
#You will be required to submit: 
#        1) a tidy data set as described below, 
#        2) a link to a Github repository with your script for performing the analysis, and 
#        3) a code book that describes the variables, the data, and any transformations 
#        or work that you performed to clean up the data called CodeBook.md. 
#You should also include a README.md in the repo with your scripts. 
#This repo explains how all of the scripts work and how they are connected.

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with 
#        the average of each variable for each activity and each subject.
        

#Download data file
if (!file.exists("./data/")) {create.dir("./data/")}
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/data.zip", method = "curl")

#Unzip file if new
if (!file.exists("./data/UCI HAR Dataset")) {unzip("./data/data.zip")}

library(reshape2)

#Load activity_labels.txt and featured.txt
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")

#Convert from factors to characters
activityLabels[ ,2] <- as.character(activityLabels[ ,2])
features[ ,2] <- as.character(features[ ,2])

#Work with only lower case
features[ ,2] <- tolower(features[ ,2])

#Keep only the mean and standard deviation
featuresMeanStd <- grep("mean|std", features[ ,2])
featuresMeanStdnames <- features[featuresMeanStd ,2]

#Substitute in more descriptive names
featuresMeanStdnames <- gsub('acc', "Acceleration", featuresMeanStdnames)
featuresMeanStdnames <- gsub('gyrojerk', "AngularAcceleration", featuresMeanStdnames)
featuresMeanStdnames <- gsub('gyro', "AngularVelocity", featuresMeanStdnames)
featuresMeanStdnames <- gsub('mag', "Magnitude", featuresMeanStdnames)
featuresMeanStdnames <- gsub('^t', "TimeDomain.", featuresMeanStdnames) 
featuresMeanStdnames <- gsub('^f', "FrequencyDomain.", featuresMeanStdnames)
featuresMeanStdnames <- gsub('mean', "Mean", featuresMeanStdnames)
featuresMeanStdnames <- gsub('std', "StandardDeviation", featuresMeanStdnames)
featuresMeanStdnames <- gsub('freq', "Frequency", featuresMeanStdnames)
featuresMeanStdnames <- gsub('bodybody', "body", featuresMeanStdnames)

#Load Test data
testSubjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
testLabels <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
testSet <- read.table("./data/UCI HAR Dataset/test/X_test.txt")[featuresMeanStd]

#Bind test data by column
testSet <- cbind(testSubjects, testLabels, testSet)

#Load Training data
trainingSubjects <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
trainingLabels <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
trainingSet <- read.table("./data/UCI HAR Dataset/train/X_train.txt")[featuresMeanStd]

#Bind training data by column
trainingSet <- cbind(trainingSubjects, trainingLabels, trainingSet)

#Merge training and test sets to create one stacked data set.
entireData <- rbind(trainingSet, testSet)

colnames(entireData) <- c("subject", "activity", featuresMeanStdnames)

entireData$subject <- as.factor(entireData$subject)
entireData$activity <- factor(entireData$activity, levels = activityLabels[ ,1], labels = activityLabels[ ,2])

#First tidy data set.
#Merges the training and the test sets to create one data set. 
#10299 obs. of  88 variables.
write.table(entireData, file = "tidyData.txt", quote = FALSE, row.name = FALSE)

#Create narrow dataset - 10299 obs down to 180 obs.
#Reshape data
entireDataMelt <- melt(entireData, id = c("subject", "activity"))

#Summarize data using mean
#with the average of each variable for each activity and each subject.
entireDataMean <- dcast(entireDataMelt, activity + subject ~ variable, mean)


#Final output of a second independent tidy data set. 
#180 obs. of  88 variables.
write.table(entireDataMean, file = "tidyData2.txt", quote = FALSE, row.name = FALSE)

