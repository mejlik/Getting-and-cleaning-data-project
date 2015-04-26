library(data.table)
library(dplyr)
library(tidyr)

## reading features' names
features<-fread("./UCI HAR Dataset/features.txt")
names(features)
features_names<-features$V2
rm("features")
length(features_names)


## reading test data
## y - activities
y_test<-fread("./UCI HAR Dataset/test/y_test.txt")
setnames(y_test, names(y_test), c("activity"))
#dim(y_test)
#unique(y_test)

## x_test - values
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
setnames(x_test, names(x_test), features_names)

## sub_test - subjects
sub_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
setnames(sub_test, names(sub_test), c("subject"))

## gathering data together
data_test<-data.table(sub_test, x_test, y_test)
rm("x_test","sub_test", "y_test")
names(data_test)

## reading training data
## y_train - activities
y_train<-fread("./UCI HAR Dataset/train/y_train.txt")
setnames(y_train, names(y_train), c("activity"))
#dim(y_train)
#unique(y_train)

## x_train - values of measurments - 
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
setnames(x_train, names(x_train), features_names)

## sub_train - subjects
sub_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
setnames(sub_train, names(sub_train), c("subject"))

## gathering data together
data_train<-data.table(sub_train, X_train, y_train)
rm("X_train","sub_train", "y_train")
#setnames(data_test, old = names(data_test), new = features_names)
#names(data_test)

## merging data
data <- rbind(data_train, data_test)
rm("data_train", "data_test")

## Extracting the measurements of the mean and the standard deviation for each measurement
vec_mean<-grepl("mean()", features_names)
vec_std<-grepl("std()", features_names)
vec_extract<-vec_mean | vec_std
vec_extract<-c(T, vec_extract, T)
sum(vec_extract)
features_vec<-1:563
features_vec<-features_vec[vec_extract]

data<-select(data, features_vec)

## descriptive names of activities
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels<-as.data.table(activity_labels)
setnames(activity_labels, names(activity_labels), c("activity", "desc_activity"))
data<-inner_join(data, activity_labels)
#names(data)
#select(data, activity, subject, desc_activity)
#table(data$desc_activity, data$subject)

## getting mean value of mesurments for subjects and activities.
## tiding data
gather_data<-gather(data, features, values, -c(activity, subject, desc_activity))
group_data<-group_by(gather_data, subject, desc_activity, features)
tidy_data<-summarize(group_data, mean_value=mean(values))
tidy_data_2<-spread(sum_data, features, mean_value)

## writing data into the file 

write.table(tidy_data, file="tidy_data.txt", row.names=FALSE)


