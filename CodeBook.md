This consists of variables, the data, and any transformations and work that has been done in the R code file.

Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The R code file ,i.e, performs the following function:-

##Transformations that have been performed
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## The dataset

Source : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The dataset includes the following files:

'README.txt'

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

Subect: subject number for 30 subjects

Columns 3:68 contain means estimated from the following signals:
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag



* The run_analysis.R loads the data using the function read.table, it reads various files.
* It merges the text files to form a new data set.
* Extract mean and standard deviation columns from the data.
* Also the code file has been thorughly explained as to how the code is running and what analysis is being done
  in order to perform the above mentioned transformations.
  
  Activity variables used in the dataset

walking

walkingupstairs

walkingdownstairs

sitting

standing

laying


The result of the file is saved in Tidy_DataSet.txt 
