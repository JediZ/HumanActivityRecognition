# run_analysis.R
# =================
# processing data collected from the accelerometers from the Samsung Galaxy S 
# smartphone. See CodeBook.md for details.
# this script takes in the raw datasets, and generate two cleaned up datasets,
# and saved in csv file format:
# tidydata.csv.txt : the dataset containing measurements with features containing mean or std
# tidydata_avg.csv.txt: the dataset containing data averaged by each subject and activity
# use read.csv to load the data 
# (the txt extension is used for coursera uploading requirement, it does not interfere with read.csv)
######
# this script does:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
######

setwd("F:/mygits/HumanActivityRecognition")
suppressMessages(require(reshape2))
datadir <- "./UCI HAR Dataset"

trainingsetfile <- paste(datadir,"train/X_train.txt",sep="/")
df<-read.table(trainingsetfile,header=FALSE)

traininglabelsfile <- paste(datadir,"train/y_train.txt",sep="/")
dfl <- read.table(traininglabelsfile)

trainingsubjectsfile <- paste(datadir,"train/subject_train.txt",sep="/")
dfs <- read.table(trainingsubjectsfile)

testsetfile <- paste(datadir,"test/X_test.txt",sep="/")
dft<-read.table(testsetfile,header=FALSE)

testlabelsfile <- paste(datadir,"test/y_test.txt",sep="/")
dftl <- read.table(testlabelsfile)

testsubjectsfile <- paste(datadir,"test/subject_test.txt",sep="/")
dfts <- read.table(testsubjectsfile)

trainingset <- cbind(dfs,dfl,df)
colnames(trainingset)[1] <- "subject"
colnames(trainingset)[2] <- "activity"

testset <- cbind(dfts,dftl,dft)
colnames(testset)[1] <- "subject"
colnames(testset)[2] <- "activity"

mergeddata <- merge(trainingset,testset,all=TRUE)

featuresfile <- paste(datadir,"features.txt",sep="/")
features <- read.table(featuresfile)
features <- as.character(features[,2])

means <- grep("-mean()",features) + 2
stds <- grep("-std()",features) + 2
features <- gsub("[()]","",features)
colnames(mergeddata)[3:ncol(mergeddata)] <- features

meanstddata <- mergeddata[,c(1,2,means,stds)]

activityfile <- paste(datadir,"activity_labels.txt",sep="/")
activities <- read.table(activityfile)



meanstddata$"activity" <- activities[meanstddata$"activity",2]

meanstddata.melt <- melt(meanstddata,id=c("subject","activity"))
cleandata_averaged <- dcast(meanstddata.melt,...~variable,mean)

write.csv(meanstddata,file="tidydata.csv.txt",row.names=FALSE)
write.csv(cleandata_averaged,file="tidydata_avg.csv.txt",row.names=FALSE)
