#this script is meant to merge the training and test data and produce a file that produces the mean with respect to a subject's activity
#the script sorts the features based on the subject and the activities(with the order listed in "activity_labels.txt".

#we first perform feature selection, that is only take features that use std() and mean()
#note that we did not include meanFreq() as I think that it is a weighted average which carries a different meaning.
#However, if your interpretation in different from mine, you just have to edit the line with grep with  grep("std|mean",features$V2)
features<-read.table("features.txt")
subfeatures<-grep("std\\(\\)|mean\\(\\)",features$V2)

#combine the training and test features and keep only the relevant features
X<-rbind(read.table("train/X_train.txt")[,subfeatures],read.table("test/X_test.txt")[,subfeatures])
colnames(X)<-features[subfeatures,2]

#combine the activities of training and test data and replace the activities id with meaningful labels.
Y<-rbind(read.table("train/y_train.txt"),read.table("test/y_test.txt"))

activity_labels<-read.table("activity_labels.txt")
Y$activity_labels<-factor(Y$V1,levels=activity_labels$V1,labels=activity_labels$V2)

#combine the subjects of trining and test data and combined with the activities.
subject<-rbind(read.table("train/subject_train.txt"),read.table("test/subject_test.txt"))
extracolumns<-cbind(subject,Y$activity)
colnames(extracolumns)<-cbind("subject","activity")

#combine everything
firstdata<-cbind(extracolumns,X)

#step 5
tidydata<-aggregate(firstdata[,3:ncol(firstdata)],by=list(firstdata$subject,firstdata$activity),FUN=mean)
colnames(tidydata)[1:2]<-c("subject","activity")
tidydata<-tidydata[order(tidydata[,1],tidydata[,2]),]
write.table(tidydata,file="tidydata.txt",row.names=FALSE)