README.md
==========

The purpose of this document is to explain the the way collect, work with, and clean a data set as a Course Project of Getting and Cleanig Data Course. 

The goal is to prepare tidy data that can be used for later analysis. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project: 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

I have downloaded the data at my working directory and unzipped it. As a result, a subdirectory "UCI HAR Dataset" was created. After that, I have created a R script called run_analysis.R as the followings.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


Step 1. Merges the training and the test sets to create one data set.
---------------------------------------------------------------------

First, I have read the three data files in subdirectory "test"" and made a test data set. 

1. 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

```r
subject_test=read.table("UCI HAR Dataset/test/subject_test.txt")
names(subject_test)="subject"
```

2. 'test/y_test.txt': Test labels.

```r
y_test=read.table("UCI HAR Dataset/test/y_test.txt")
names(y_test)="label"
```

3. 'test/X_test.txt': Test set.
To read the test sets, I have made a vector with 561 length named "colname" and read the data.


```r
colnames=1:561
x_test=read.table("UCI HAR Dataset/test/x_test.txt",col.names=colnames)
```

4. Merge the three data files to make a test data set.


```r
test=cbind(subject_test,y_test,x_test)
```

And then I have made a train data set.

```r
subject_train=read.table("UCI HAR Dataset/train/subject_train.txt")
names(subject_train)="subject"
y_train=read.table("UCI HAR Dataset/train/y_train.txt")
names(y_train)="label"
colnames=1:561
x_train=read.table("UCI HAR Dataset/train/x_train.txt",col.names=colnames)
train=cbind(subject_train,y_train,x_train)
```

Finally I merged the training and the test sets to create one data set.


```r
data=rbind(train,test)
```

Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
-------------------------------------------------------------------
I have read the 561 features vector names from the "features.txt" as a dataframe, made a variable with colname "select" to find the vector names containing "mean"" or "std" and made a subset with features$select is TRUE.

```r
features=read.table("UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)
features$select=grepl("mean|std",features$V2)
features_select=features[features$select==TRUE,]
```

Make a subset of the dataset created at Step 1.  

```r
data_select=data[,c(TRUE,TRUE,features$select)]
```

Step 3. Uses descriptive activity names to name the activities in the data set
-----------------------------------------------------------------------------
First, I have read the activity labels from the data directory and save it as a dataframe named activity_labels. 


```r
activity_labels=read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels
```
And add a "activity"" field to the dataset created at Step 2.


```r
data_select$activity=levels(activity_labels[,2])[activity_labels[data_select$label,2]]
```


Step 4. Appropriately labels the data set with descriptive variable names. 
---------------------------------------------------------------------------

I have labelled the data set with descriptive variable names.

```r
colnames(data_select)=c("subject","label",features_select$V2,"activity")
```

Step 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
-----------------------------------------------

For this step, I used several functions from library 'reshape','plyr' and 'dplyr'


```r
library(reshape)
library(dplyr)
library(plyr)
```

I have made a data.table and selected necessary columns

```r
data_df=tbl_df(data_select)
data_df1=select(data_df,subject,activity,c(3:81))
```

And melted the datatable into tidy datasets.

```r
mdf=melt(data_df1,id=c("subject","activity"))
```

And then grouped by each activity of each subject and summarise the mean of each variable. 

```r
data_df2=group_by(mdf,subject,activity,variable)
data_df3=summarise(data_df2,average=mean(value))
```

And write a text file with the tidy data set.

```r
write.table(data_df3,file="tidydata.txt",quote=FALSE,sep=" ",eol="\n")
```


