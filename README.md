gettingDataProject
==================

Peer assessment project for the Coursera Getting and Cleaning Data course, April 2014.

## Contents
This repository contains the following files:
* run_analysis.R -- the R processing script
* tidyset.txt -- the final processed output file, averaged over each activity and subject
* CodeBook.md -- the code book describing the output file variabless, data, and processing steps

### NOTE
The analysis script assumes the data package has already been downloaded and unzipped in the working directory, preserving the data's directory structure.

## Processing steps
1. Load the training and test sets, assuming the archive is already unzipped in the working directory. Also load the corresponding subject and activity data files.
2. Assign variable names using the contents of features.txt.
3. Combine the data, subject IDs, and activity IDs into a data frame.
4. Combine the train and test data sets into one combined data set.
5. Replace activity number codes with names of the activities from activity_labels.txt.
6. Extract only the activity, subject, and mean & standard deviation variables by subsetting the variables containing "mean" or "std" in their name.
7. Create a tidy data set while averaging over each subject for each activity. 'melt()' and 'recast()' from the reshape2 package were used to transform the data.
8. Write the tidy data set to a text file.

## Assignment description
Taken from the assignment page:  
"The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following.  
1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set  
4. Appropriately labels the data set with descriptive activity names.  
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject."
