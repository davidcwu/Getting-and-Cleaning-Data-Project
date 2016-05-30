# Getting-and-Cleaning-Data-Project

---

Collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

---

##Course Project

###Create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

---

##Process

`run_analysis.R` does the following to create two output data text files: `tidyData.txt` and `tidyData2.txt`.

1. Downloads zipped UCI HAR datasets from d396qusza40orc.cloudfront.net.
2. Unzips data file.
3. Loads activity and features data.
4. Keeps `Mean and Standard Deviation` data.
5. Loads `test` data.
6. Loads `training` data.
7. Merges test and training data.
8. Creates first output file `tidyData.txt` containing 10299 obs. with 88 variables.
9. Melts and recasts first tidy data using activity, subjects and mean.
10. Creates second output file `tidyData2.txt` containing 180 obs. of  88 variables.

---

##Cleaned Output Data

The first of two outputs is `tidyData.txt`, which contains 10299 obs. of  88 variables.

The second of two outputs is `tidyData2.txt`, which contains 180 obs. of  88 variables.
