#Getting and Cleaning data course project
#This will perform the following function:-
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

****************************************************************************************************************************
# 1. Merges the training and the test sets to create one data set.

#The file is downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#using the function download.file()
#First of all you need to set up your working directory so that the downloaded data is kept there and can be read easily.
setwd("C:/Users/shreya.arora/Documents/UCI HAR Dataset")
#Now the desired files can be read. YOu can assign objects to the read file and can then use it later
features = read.table('./features.txt',header=FALSE)
activity_labels = read.table('./activity_labels.txt',header=FALSE)
subject_train = read.table('./train/subject_train.txt',header=FALSE)
x_train = read.table('./train/x_train.txt',header=FALSE)
y_train = read.table('./train/y_train.txt',header=FALSE)
subject_test = read.table('./test/subject_test.txt',header=FALSE)
x_test = read.table('./test/x_test.txt',header=FALSE)
y_test = read.table('./test/y_test.txt',header=FALSE)

#Joining the data
#Joining training data
training_data = cbind(x_train,y_train,subject_train)

#Joining the test data
test_data = cbind(x_test,y_test,subject_test)

#final data
data_final <- rbind(training_data,test_data)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#Naming the columns
col.names(features)=c("feature_id", "feature_label")
extract <- features[grepl("mean\\(\\)", features$feature_label) | grepl("std\\(\\)", features$feature_label), ]

# 3. Uses descriptive activity names to name the activities in the data set
#Naming the columns
col.names(activity_labels)=c("activity_id", "activity_label")
data_des = merge(data_features, activity_labels)

#Step 4: "Appropriately labels the data set with descriptive activity names." 
extract$feature_label = gsub("\\(\\)", "", extract$feature_label)
extract$feature_label = gsub("-", ".", extract$feature_label)
for (i in 1:length(extract$feature_label)) {
    colnames(data3)[i + 3] <- extract$feature_label[i]
}
data_des = data_features

#Step 5: "Creates a second, independent tidy data set with the average of each variable for each activity and each subject."
drops <- c("ID","activity_label")
data_step5 <- data_des[,!(names(data4) %in% drops)]
aggdata <-aggregate(data_des, by=list(subject = data_step5$subject_id, activity = data_step5$activity_id), FUN=mean, na.rm=TRUE)
drops <- c("subject","activity")
aggdata <- aggdata[,!(names(aggdata) %in% drops)]
aggdata = merge(aggdata, activity_labels)
write.table(file="Tidy_DataSet.txt", x=aggdata)
