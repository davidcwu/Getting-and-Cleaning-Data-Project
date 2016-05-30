#CodeBook of variables, data, and transformations.



##Data

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

---

##Variables



###Test and Training variables


* `activityLabels` - contents of UCI HAR Dataset/activity_labels.txt.
* `features` - contents of UCI HAR Dataset/features.txt.
* `featuresMeanStdnames` - contains filtered mean and standard deviation.
* `testSubjects` - contents of UCI HAR Dataset/test/subject_test.txt.
* `testLabels` - contents of UCI HAR Dataset/test/y_test.txt.
* `testSet` - contains bound subject, label, and test data.
* `trainingSubjects` - contents of UCI HAR Dataset/train/subject_train.txt.
* `trainingLabels` - contents of UCI HAR Dataset/train/y_train.txt.
* `trainingSet` - contains bound subject, label, and training data.
* `entireData` - contains bound training and test data together.
* `entireDataMean` - contains final data where all data melted and casted.

---

##Transformations



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

##Output 1


The first of two outputs is `tidyData.txt`, which contains 10299 obs. of  88 variables.

##Output 2


The second of two outputs is `tidyData2.txt`, which contains 180 obs. of  88 variables.

