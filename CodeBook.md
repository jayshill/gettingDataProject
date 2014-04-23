# Description of tidyset.txt

## tidyset.txt variable names
NOTE: Variable names that end in [X,Y,Z] represent three different variables: one each for the X, Y, and Z directions

**activity** -- activity performed by the subject; coded as one of:  
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

**subject** -- the test subject from whom data was collected    

The meaning of the variable names listed below can be pieced together according to the following convention:  
[t|f]\[measurement]-\[mean|std] ( )-[X,Y,Z]  
where:  
* t is a time domain value and f is a frequency domain variable
* measurement is one of the following:
  * BodyAcc -- body component of acceleration
  * GravityAcc -- gravity component of acceleration
  * BodyAccJerk -- jerk from body acceleration signal
  * BodyGyro -- body gyroscope signal
  * BodyGyroJerk -- jerk from body gyroscope signal
  * BodyAccMag -- magnitude of the body acceleration vector
  * GravityAccMag -- magnitude of the gravity acceleration vector
  * BodyAccJerkMag -- magnitude of the body acceleration jerk
  * BodyGyroMag -- magnitude of the body gyroscope signal
  * BodyGyroJerkMag -- magnitude of the body gyroscope jerk signal
* mean is the mean of the value and std is the standard deviation
* X,Y,X is the component of the variable in the X, Y, or Z direction, if applicable

**tBodyAcc-mean()-[X,Y,Z]**  
**tBodyAcc-std()-[X,Y,Z]**  
**tGravityAcc-mean()-[X,Y,Z]**  
**tGravityAcc-std()-[X,Y,Z]**  
**tBodyAccJerk-mean()-[X,Y,Z]**  
**tBodyAccJerk-std()-[X,Y,Z]**  
**tBodyGyro-mean()-[X,Y,Z]**  
**tBodyGyro-std()-[X,Y,Z]**  
**tBodyGyroJerk-mean()-[X,Y,Z]**  
**tBodyGyroJerk-std()-[X,Y,Z]**  
**tBodyAccMag-mean()**  
**tBodyAccMag-std()**  
**tGravityAccMag-mean()**  
**tGravityAccMag-std()**  
**tBodyAccJerkMag-mean()**  
**tBodyAccJerkMag-std()**  
**tBodyGyroMag-mean()**  
**tBodyGyroMag-std()**  
**tBodyGyroJerkMag-mean()**  
**tBodyGyroJerkMag-std()**  
**fBodyAcc-mean()-[X,Y,Z]**  
**fBodyAcc-std()-[X,Y,Z]**  
**fBodyAcc-meanFreq()-[X,Y,Z]**  
**fBodyAccJerk-mean()-[X,Y,Z]**  
**fBodyAccJerk-std()-[X,Y,Z]**  
**fBodyAccJerk-meanFreq()-[X,Y,Z]**  
**fBodyGyro-mean()-[X,Y,Z]**  
**fBodyGyro-std()-[X,Y,Z]**  
**fBodyGyro-meanFreq()-[X,Y,Z]**  
**fBodyAccMag-mean()**  
**fBodyAccMag-std()**  
**fBodyAccMag-meanFreq()**  
**fBodyBodyAccJerkMag-mean()**  
**fBodyBodyAccJerkMag-std()**  
**fBodyBodyAccJerkMag-meanFreq()**  
**fBodyBodyGyroMag-mean()**  
**fBodyBodyGyroMag-std()**  
**fBodyBodyGyroMag-meanFreq()**  
**fBodyBodyGyroJerkMag-mean()**  
**fBodyBodyGyroJerkMag-std()**  
**fBodyBodyGyroJerkMag-meanFreq()**  

## Notes on the source of the data
NOTE: These variables are the processed data compiled from the following source files from the UCI HAR Dataset:
* /test/subject_test.txt
* /test/X_test.txt
* /test/y_test.txt
* /train/subject_train.txt
* /train/X_train.txt
* /train/y_train.txt
* activity_labels.txt
* features.txt  
The raw inertial signals data were not included in this analysis.

## Processing steps
1. Load the training and test sets, assuming the archive is already unzipped in the working directory. Also load the corresponding subject and activity data files.
2. Assign variable names using the contents of features.txt.
3. Combine the data, subject IDs, and activity IDs into a data frame.
4. Combine the train and test data sets into one combined data set.
5. Replace activity number codes with names of the activities from activity_labels.txt.
6. Extract only the activity, subject, and mean & standard deviation variables by subsetting the variables containing "mean" or "std" in their name.
7. Create a tidy data set while averaging over each subject for each activity. 'melt()' and 'recast()' from the reshape2 package were used to transform the data.
8. Write the tidy data set to a text file.

## Processing environment
The data were processed using the R statistical programming language, version 3.1.0 64-bit through the RStudio integrated development environment (version 0.98.501) on a computer running Windows 7 Professional 64-bit.