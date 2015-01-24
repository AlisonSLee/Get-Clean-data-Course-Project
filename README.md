# Get-Clean-data-Course-Project
===============================
**Coursera 'Getting and Cleaning Data' course - Course Project Info**

**Project:**     Coursera - Getting and Cleaning Data - Course Project

Script name: run_analysis.R

Purpose:     To demonstrate the ability to collect, work with, and clean a dataset

Data source: This project takes data from the following source:
             https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
             
Data created: The script creates a dataset called 'all_data_tall' that is a tidy dataset for Step 4 of course project
              (i.e. it holds all the data relating to measurements on mean and standard deviation)
              From this a dataset called 'avg_data_tall' is created.
              This is a tidy dataset for Step 5 of course project
              (i.e. it holds the average of each variable for each activity and each subject)
              
Output:       This is written out as a text file called 'Project_Step5_Average_Data.txt'
              This text file can be read in & looked at in R using the following command: 
                  data <- read.table(file_path, header = TRUE) 
                  View(data)
                  
The data used as input to this project is from a Human Activity Recognition Using Smartphones Dataset
produced by:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws  www.smartlab.ws

The input data is from experiments carried out with a group of 30 volunteers. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

More information on this input data is available from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

**Using this data, the script performs the following steps:**
========================================================
1.Merges the training and the test sets to create one data set.

2.Extracts only the measurements on the mean and standard deviation for each measurement.
  This was done by searching for the text 'mean' and 'std' in the 'features' data.
  
3.Applies descriptive activity names (from activity_labels) to name the activities in the data set and
  merges the subject & activity data onto the mean & std measurements data.
  
4.Appropriately labels the data set with descriptive variable names. 
  This was done by replacing the original text from the 'features' data with text as follows
  
    Original text   Replacement text  Notes
    BodyBody        Body              BodyBody deemed to be a duplication error in original dat
    t               Time              Features info states that prefix t denotes time
    f               Freq              Features info states that prefix f denotes frequency domain signals
    Acc             Acceleration      N.B. the acceleration signal is separated into body & gravity signals
    Mag             Magnitude         Features info states Mag denotes the Magnitude of the signals
  Text denoting 'Jerk' signals was not renamed as Jerk was already descriptive.
  Similarly text 'XYZ' in the descriptions was left unchanged as I felt it already adequately denoted the 3-axial 
  signals in the X, Y & Z directions.
  
  The data was transformed from a wide dataset to a tall, narrow dataset,all_data_tall, to make it easier to read.
  So this tall dataset has the descriptive variable name in a column called 'Measurement_Name' and the actual numeric 
  value of the measurement in a column called 'Measurement_Value'.
  
5.From the all_data_tall dataset created in step 4, a second, independent tidy dataset is created that holds
  the average of each measurement variable for each activity and each subject.
  
  This is also saved as a tall, narrow dataset & given the name avg_data_tall.
  
  This consists of 4 columns: Subject_ID, Activity, Measurement_Name, Mean.
  
  This final dataset is written out as a text file called 'Project_Step5_Average_Data.txt'.
  
Further information on the data is supplied in the associated Code Book.

For more detail you can also refer to the comments supplied in the actual R script.
