#********************************************************************************************************************
#  Project:     Coursera - Getting and Cleaning Data - Course Project 
#  Script name: run_analysis.R
#  Purpose:     To demonstrate the ability to collect, work with, and clean a dataset
#  Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
#  Go to the above link to the data source for this project
#  Firewall issues prevent me using download.file
#  So I first went to the weblink above and saved the following text files to the working directory:
#     activity_labels.txt, features.txt, subject_test, subject_train, X_test.txt, X_train.txt, y_test.txt, y_train.txt
#
#  Primary output:   A dataset called 'all_data_tall' that is a tidy dataset for Step 4 of course project
#                    (i.e. it holds all the data relating to measurements on mean and standard deviation)
#
#  Secondary output: A dataset called 'avg_data_tall' that is a tidy dataset for Step 5 of course project
#                    (i.e. it holds the average of each variable for each activity and each subject)
#                    This is written out as a text file called 'Project_Step5_Average_Data.txt'
#
#*******************************************************************************************************************

#  Load any required packages
library(plyr)
library(reshape2)

# Read in the subject data for test & training data
# This has one row for every row that is in the main results data (in X_test & X_train) and has a single 
# column V1 that indentifies the subject who performed the activity for that sample.
# Rename this column V1 to 'Subject_ID'
# Append the training data to end of the test data & rename whole dataset all_subjects
subj_test<-read.table("subject_test.txt")
subj_train<-read.table("subject_train.txt")
all_subjects<-rbind(subj_test,subj_train)
names(all_subjects)<-c("Subject_ID")

# Read in the activity class data for test & train and concatenate it together renaming
# the default column V1 to 'Actvity_type'
y_test<-read.table("y_test.txt")
y_train<-read.table("y_train.txt")
y_all<-rename(rbind(y_test,y_train),c("V1"="Activity_type"))

# Read in the activity_labels.txt file which describes each of the activities (Walking, Sitting etc)
# and rename the default columns V1 & V2
Activity<-read.table("activity_labels.txt")
names(Activity)<-c("Activity_type","Activity")

# Merge the Activity onto the y_all dataset and then combine this to the all_subjects data
# and then drop the numeric Activity_type column as it is no longer needed.
y_all<-merge(y_all,Activity)
all_subjects<-cbind(all_subjects,y_all)
all_subjects<-all_subjects[,c("Subject_ID","Activity")]

# Read in the test data & the training data
X_test<-read.table("X_test.txt")
X_train<-read.table("X_train.txt")

# Read in the features data that contains the descriptions of the columns in the main X_test & X_train data
features<-read.table("features.txt")

# Find those columns that contain the text 'mean' in the description (V2)
meancols<-grep("mean",features$V2,ignore.case=TRUE)

# Subset features to just keep the rows relating to these 'mean' columns
meanvars<-features[c(meancols),]

# Find those columns that contain the text 'std' in the description (V2)
stdcols<-grep("std",features$V2,ignore.case=TRUE)

# Subset features to just keep the rows relating to these 'std' columns
stdvars<-features[c(stdcols),]

# Combine these mean & std datasets together & reorder by column V1 (variable number)
reqdvars<-rbind(meanvars,stdvars)
reqdvars<-arrange(reqdvars,V1)

# Column V1 of reqdvars is simply an integer (1, 2, 3 etc) that indicates the column number we actually want from the test data
# In order to extract the correct columns from the data we need to convert this to a character (V1, V2, V3 etc)
reqdcols<-c(paste("V",reqdvars$V1,sep=""))

# Combine the test & training data together, keeping just the std & mean columns
all_data<-rbind(X_test,X_train)[,c(reqdcols)]

# Find the names of the std & means columns we've kept & make them more descriptive 
# N.B. Use as.character as without this R will by default create factor
reqdnames<-as.character(reqdvars[,"V2"])

# Make the variable names taken from features data more descriptive and readable
# by doing a global substitution (function gsub) of particular text strings
# Also remove '()' that appears in some of the descriptions as not allowed in R column names
oldtext<-list("BodyBody","tBody","tGravity","fBody","fGravity","Acc","Mag","()","_-")
newtext<-list("Body","Time_Body_","Time_Gravity_","Freq_Body_","Freq_Gravity_","Acceleration_","Magnitude","","-")

# Having specified the old text & replacement text in the lists above, can now create a function
# called multi_sub (mulitple substitutions) that goes through & replaces each text string in turn.
# N.B. Need to set fixed=TRUE in gsub otherwise it will treat '()' as a special character & not replace it.

multi_sub<-function(pattern, replacement,original,...){
    result <- original
    for (i in 1:length(pattern)){
        result<-(gsub(pattern[i],replacement[i],result,fixed=TRUE))
    }
    result
}

# Set newnames to hold  the result of the above function so that we can rename the V1-V561 columns
# in all_data to have well described names
newnames<-multi_sub(oldtext,newtext,reqdnames)
names(all_data)<-c(newnames)

# Add the Subject_ID and Activity columns (created earlier in script) onto the all_data
all_data<-cbind(all_subjects, all_data)

# The above 'all_data' is a wide dataset, but below we convert it to a tall, skinny dataset
# that keeps Subject_ID and Activity but then has a 'Measurement_Name' variable to hold the description
# of the measurement and a 'Measurement_Value' variable to hold the actual numeric value.

all_data_tall<-melt(all_data,id=c("Subject_ID","Activity"),measure.vars=c(newnames))
all_data_tall<-rename(all_data_tall,c("variable"="Measurement_Name","value"="Measurement_Value"))

#********************************************************************************************************
#  This all_data_tall is now a tidy datatset with descriptive variable names as required for Step 4 of Project 
#********************************************************************************************************

# Now find averages per activity & subject for step 5 of Project

avg_data<-dcast(all_data_tall,Subject_ID + Activity ~ Measurement_Name,mean)

# dcast creates this as a wide table with the mean for each measurement a separate column
# Use melt to convert this back to a tall table

avg_data_tall<-melt(avg_data,id=c("Subject_ID","Activity"),measure.vars=c(newnames))
avg_data_tall<-rename(avg_data_tall,c("variable"="Measurement_Name","value"="Mean"))

# Write this out ready for uploading to course project

write.table(avg_data_tall,file="Project_Step5_Average_Data.txt",row.names=FALSE)

# Also write out some of the other intermediate files that might contain useful information
# for  inclusion in the Code Book &/or Readme file

write.csv(Activity,"Activity.csv")
write.csv(reqdvars,"reqdvars.csv")
write.csv(newnames,"newnames.csv")
