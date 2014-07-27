
=======

##Getting and Cleaning Data

### Instructions 
####You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


### Steps to work on this course project

1. Download the data source and expand the compressed dataset to a  <code>UCI HAR Dataset </code> directory.
2. Put run_analysis.R in the parent directory of  <code>UCI HAR Dataset </code>
3. Then set the the parent directory of  <code>UCI HAR Dataset </code> as your working directory using  <code>setwd() </code> function R.
4. Run  <code>source("run_analysis.R </code>"), then it will generate a new file  <code>tiny_data.txt </code> in your working directory.
5. <code>run_analysis.R </code> file will help you to install the dependencies automatically. It depends on  <code>library(reshape2)</code> and  <code>library(data.table)</code>.

=======
 
