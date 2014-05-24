#Load reshape2 library which contains melt and dcast function 
library(reshape2)

#Load activity levels lookup form its file.
activity.levels<-read.table("activity_labels.txt")
names(activity.levels)<-c("activity.id","activity.name")

#Load the features names
features.names<-read.table("features.txt")
names(features.names)<-c("feature.id","feature.name")

#Load the training and the testing dataset
train.X<-read.table("train/X_train.txt")
test.X<-read.table("test/X_test.txt")

#Load the activity level Ids file for the training and the testing datasets.
train.Y<-read.table("train/y_train.txt")
test.Y<-read.table("test/y_test.txt")

#Add the Activity Level name to the training and the testing dataset
train.Y<-merge(train.Y,activity.levels,by.x="V1",by.y="activity.id")
test.Y<-merge(test.Y,activity.levels,by.x="V1",by.y="activity.id")

#Load the subjects Ids file for the training and the testing datasets.
train.subject<-read.table("train/subject_train.txt")
test.subject<-read.table("test/subject_test.txt")

#Replace the default names for the training and teh testing datasets with the features names loaded in a previous step.
names(train.X)<-features.names[,2]
names(test.X)<-features.names[,2]

#Add the Subject Id column to the training and the testing datasets.
train.X$SubjectId<-train.subject[,1]
test.X$SubjectId<-test.subject[,1]

#Add the Activity Level Name column to the training and the testing datasets.
train.X$ActivityLevel<-train.Y$activity.name
test.X$ActivityLevel<-test.Y$activity.name

#Adding a debugging column to idetifiy the training dataset from the testing dataset when they are merged in one dataset.
train.X$DataType<-"Training"
test.X$DataType<-"Testing"

#Merging the training and testing datasets in one dataset called "all.data".
all.data<-rbind(train.X,test.X)

#Get Columns which contains mean or std measures in the created dataset into new dataset
Mean.Std.Ind<-grep("\\-mean|\\-std|subjectid|activitylevel",tolower(names(all.data)))
Mean.Std.Data<-all.data[,Mean.Std.Ind]

#Reshaping the generated data set to generate the Mean for each Measure per Subject Id per Activity Level.
MeltedData<-melt(Mean.Std.Data,c("SubjectId","ActivityLevel"))
Avg.Data<-dcast(MeltedData,SubjectId+ActivityLevel~variable,mean,drop=F)

#Renaming the measures to be appropriate names without special characters.
names(Avg.Data)<-gsub("Acc","Accelerometer",names(Avg.Data),fixed=T)
names(Avg.Data)<-gsub("Gyro","Gyroscope",names(Avg.Data),fixed=T)
names(Avg.Data)<-gsub("^t","TimeDomain",names(Avg.Data))
names(Avg.Data)<-gsub("^f","FrequencyDomain",names(Avg.Data))
names(Avg.Data)<-gsub("Mag","Magnitude",names(Avg.Data),fixed=T)
names(Avg.Data)<-gsub("meanFreq","MeanFrequency",names(Avg.Data),fixed=T)
names(Avg.Data)<-gsub("mean","Mean",names(Avg.Data),fixed=T)
names(Avg.Data)<-gsub("std","StandardDeviation",names(Avg.Data),fixed=T)
names(Avg.Data)<-gsub("-","",names(Avg.Data),fixed=T)
names(Avg.Data)<-gsub("()","",names(Avg.Data),fixed=T)
names(Avg.Data)[3:length(names(Avg.Data))]<-gsub("^","Mean",names(Avg.Data)[3:length(names(Avg.Data))])
write.csv(Avg.Data,file="tidyData.csv",row.names = FALSE)
