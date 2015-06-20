##download and unzip datasets
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile="init.zip", method="auto")
unzip("init.zip")

##import names of variables
varNames<-read.table("UCI HAR Dataset/features.txt")

##import train data
trainX<-read.table("UCI HAR Dataset/train/X_train.txt")
trainY<-read.table("UCI HAR Dataset/train/y_train.txt")
names(trainX)<-varNames[,2]
trainSubject<-read.table("UCI HAR Dataset/train/subject_train.txt")
trainX$activity<-as.factor(trainY[,1])
trainX$subject<-as.factor(trainSubject[,1])

##import test data
testX<-read.table("UCI HAR Dataset/test/X_test.txt")
testY<-read.table("UCI HAR Dataset/test/y_test.txt")
names(testX)<-varNames[,2]
testSubject<-read.table("UCI HAR Dataset/test/subject_test.txt")
testX$activity<-as.factor(testY[,1])
testX$subject<-as.factor(testSubject[,1])

##merge data
merged<-rbind(trainX,testX)

##add activities names
labels<-read.table("UCI HAR Dataset/activity_labels.txt")
names(labels)<-c("id","activity")
levels(merged$activity)<-labels$activity

##extract means and standard dev
means<-grepl("mean", names(merged))
stds<-grepl("std", names(merged))
resData<-merged[, 562:563]
resData<-cbind(resData,merged[,means],merged[,stds])
## create independent  set
independent<-NULL
independent<-data.frame(matrix(ncol=81, nrow=0))
names(independent)<-names(resData)
for (i in 1:30) {
    for (k in 1:6) {
        act<-labels$activity[k]
        independent[k+(i-1)*6,2]<-i
        independent[k+(i-1)*6,1]<-act
        for(j in 3:81) {
            independent[k+(i-1)*6,j]<-mean(resData[as.numeric(resData$subject)==i 
                                                   & resData$activity==act,j])
        }
    }
}
independent$activity<-as.factor(independent$activity)
independent$subject<-as.factor(independent$subject)
levels(independent$activity)<-labels$activity

##export independent  dataset
write.table(independent, file="independentDataSet .txt", row.name=FALSE)
