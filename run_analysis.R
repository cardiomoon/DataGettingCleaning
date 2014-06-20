activity_labels=read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels

features=read.table("UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)
head(features,10)
str(features)
features$select=grepl("mean|std",features$V2)
str(features$select)
features_select=features[features$select==TRUE,]
head(features_select,10)
str(features_select$V2)

#levels(activity_labels[,2])[activity_labels[1,2]]
#str(activity_labels)
subject_test=read.table("UCI HAR Dataset/test/subject_test.txt")
names(subject_test)="subject"
y_test=read.table("UCI HAR Dataset/test/y_test.txt")
names(y_test)="label"
#str(y_test)
colnames=1:561
#colnames
x_test=read.table("UCI HAR Dataset/test/x_test.txt",col.names=colnames)
test=cbind(subject_test,y_test,x_test)
#str(test)
test$test=TRUE


subject_train=read.table("UCI HAR Dataset/train/subject_train.txt")
names(subject_train)="subject"
y_train=read.table("UCI HAR Dataset/train/y_train.txt")
names(y_train)="label"
#str(y_test)
colnames=1:561
#colnames
x_train=read.table("UCI HAR Dataset/train/x_train.txt",col.names=colnames)
train=cbind(subject_train,y_train,x_train)
#str(train)
train$test=FALSE

#1.Merges the training and the test sets to create one data set.
data=rbind(train,test)

#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
data_select=data[,c(TRUE,TRUE,features$select,TRUE,TRUE)]

#3.Uses descriptive activity names to name the activities in the data set
data_select$activity=levels(activity_labels[,2])[activity_labels[data_select$label,2]]
#data[110:116,c(2,565)]

#4. Appropriately labels the data set with descriptive variable names. 
colnames(data_select)=c("subject","label",features_select$V2,"test","activity")
colnames(data_select)
str(data_select)

#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape)
library(dplyr)
library(plyr)
data_df=tbl_df(data_select)
data_df1=select(data_df,subject,activity,c(3:81))
mdf=melt(data_df1,id=c("subject","activity"))
data_df2=group_by(mdf,subject,activity,variable)
data_df3=summarise(data_df2,average=mean(value))
data_df3
write.table(data_df3,file="tidydata.txt",quote=FALSE,sep=" ",eol="\n")
