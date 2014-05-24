#Here is how to make a table with your variables that you can just paste into your markdown CodeBook.md file (I am using the Rstudio editor):
  
#  From R console, generate a data frame with the list of variable names from your tidy dataset, write to disk

#listOfVariables <- data.frame(names(tidyDataset))
#write.csv(listOfVariables,"listOfVariables.csv")

#Start a New Google Spreadsheet
#Import your CSV file by File > Import > Upload (look for the file you just created)
#Copy and paste into the markdown table generator at:http://www.tablesgenerator.com/markdown\_tables
#Scroll down to the Generate button, press it.
#Copy to clipboard (using the button provided).


### Write comment in the Readme that using Camel convension doue to long variable names

###1
activity.levels<-read.table("activity_labels.txt")
names(activity.levels)<-c("activity.id","activity.name")

features.names<-read.table("features.txt")
names(features.names)<-c("feature.id","feature.name")

train.X<-read.table("train/X_train.txt")
test.X<-read.table("test/X_test.txt")

train.Y<-read.table("train/y_train.txt")
test.Y<-read.table("test/y_test.txt")

train.Y<-merge(train.Y,activity.levels,by.x="V1",by.y="activity.id")
test.Y<-merge(test.Y,activity.levels,by.x="V1",by.y="activity.id")

train.subject<-read.table("train/subject_train.txt")
test.subject<-read.table("test/subject_test.txt")

names(train.X)<-features.names[,2]
names(test.X)<-features.names[,2]

train.X$SubjectId<-train.subject[,1]
test.X$SubjectId<-test.subject[,1]
###3
train.X$ActivityLevel<-train.Y$activity.name
test.X$ActivityLevel<-test.Y$activity.name

train.X$DataType<-"Training"
test.X$DataType<-"Testing"
all.data<-rbind(train.X,test.X)
#all.data$SubjectId<-as.factor(all.data$SubjectId)
#all.data$DataType<-as.factor(all.data$DataType)
#all.data$ActivityLevel<-as.factor(all.data$ActivityLevel)

###2
Mean.Std.Ind<-grep("\\-mean|\\-std|subjectid|activitylevel",tolower(names(all.data)))
Mean.Std.Data<-all.data[,Mean.Std.Ind]

###5
MeltedData<-melt(Mean.Std.Data,c("SubjectId","ActivityLevel"))
AvgData<-dcast(MeltedData,SubjectId+ActivityLevel~variable,mean,drop=F)

names(AvgData)<-gsub("Acc","Accelerometer",names(AvgData),fixed=T)
names(AvgData)<-gsub("Gyro","Gyroscope",names(AvgData),fixed=T)
names(AvgData)<-gsub("^t","TimeDomain",names(AvgData))
names(AvgData)<-gsub("^f","FrequencyDomain",names(AvgData))
names(AvgData)<-gsub("Mag","Magnitude",names(AvgData),fixed=T)
names(AvgData)<-gsub("meanFreq","MeanFrequency",names(AvgData),fixed=T)
names(AvgData)<-gsub("mean","Mean",names(AvgData),fixed=T)
names(AvgData)<-gsub("std","StandardDeviation",names(AvgData),fixed=T)
names(AvgData)<-gsub("-","",names(AvgData),fixed=T)
names(AvgData)<-gsub("()","",names(AvgData),fixed=T)
names(AvgData)[3:length(names(AvgData))]<-gsub("^","Mean",names(AvgData)[3:length(names(AvgData))])
write.csv(AvgData,file="tidyData.csv",row.names = FALSE)
