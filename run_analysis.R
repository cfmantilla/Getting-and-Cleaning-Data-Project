

Activity.Labels <- read.table("activity_labels.txt", 
			      col.names=c("Activity.Code","Activity.Label"))

Features <- read.table("features.txt", col.names=c("Index","Function.Name"))

## From the features_info.txt file we know the Mean value columns have "mean" 
## in their name and Standard deviation columns have "std"; the indices for
## the columns we want are: 
Measurement.Columns <- sort(c(grep("std", Features$Function.Name),
			      grep("mean",Features$Function.Name)))

## Activity and subject codes
y_test <- read.table("test/y_test.txt",col.names="Activity.Code")
y_train <- read.table("train/y_train.txt",col.names="Activity.Code")
subject_test<-read.table("test/subject_test.txt", col.names="Subject.Code")
subject_train<-read.table("train/subject_train.txt", col.names="Subject.Code")

## Importing test data, we only need a subset of columns
x_test<-read.table("test/X_test.txt")
test<-x_test[,Measurement.Columns]

## x_test is a big table and it is no longer needed
rm(x_test)

## adds column names on features.txt to the data frame
names(test)<-Features[Measurement.Columns,]$Function.Name

## append the activity and subject codes to test data frame
test$Activity.Code <- y_test$Activity.Code
test$Subject.Code <- subject_test$Subject.Code
rm(y_test)
rm(subject_test)

## this does the same for the training data:
x_train<-read.table("train/X_train.txt")
train<-x_train[,Measurement.Columns]
rm(x_train)
names(train)<-Features[Measurement.Columns,]$Function.Name
train$Activity.Code <- y_train$Activity.Code
train$Subject.Code <- subject_train$Subject.Code
rm(y_train)
rm(subject_train)

## test.train has all observations
test.train<-rbind(test,train)

## assigning activity labels from the activity codes:
HAR<-subset(merge(test.train,Activity.Labels, all.x=TRUE), select=-Activity.Code)
rm(test.train)

## This is the resulting dataset with the averages by activity and subject:
result <- aggregate(subset(HAR, select=-c(Activity.Label,Subject.Code)), 
	  by=list(Activity=HAR$Activity.Label, Subject=HAR$Subject.Code), FUN=mean)

write.table(result,"Averages_by_Activity_and_Subject.txt", col.names=TRUE, row.names=FALSE)



