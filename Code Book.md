# Get-Clean-data-Course-Project
===============================
Coursera 'Getting and Cleaning Data' course - Course Project Info

This Code Book describes the output created by the run_analysis script.

For Step 4 of the Project the script creates a dataset called all_data_tall

For Step 5 of the Project the script creates a dataset called avg_data_tall which is then output to a text file called
'Project_Step5_Average_Data.txt'

**These two datasets all_data_tall and avg_data_tall are described below:**

## 1. all_data_tall
---------------
**Description:**	The all_data_tall dataset holds the merged subject, activity & test & train data for the variables relating to mean and standard deviation.

**Structure:**		A tall, narrow dataset with just 4 variables & rows for each measurement for all subjects and activities.

**Columns:**  4 columns: Subject ID, Activity, Measurement_Name, Measurement_Value

 **Column Name:	Subject ID**
 * **Description:**	Holds the subject identifier relating to the volunteer for whom this measurement relates
 * **Type:**		Integer
 * **Values:**		1 to 30

**Column Name:	Activity**
 * **Description:**	Holds the Activity (as a descriptive text) for which this measurement relates
 * **Type:** Factor
 * **Values:**		Six possible values:
   * WALKING
   * WALKING_UPSTAIRS
   * WALKING_DOWNSTAIRS
   * SITTING
   * STANDING
   * LAYING

**Column Name:	Measurement_Value**
 * **Description:**	Holds the actual value (i.e. mean or std) for this measurement
 * **Type:**		Integer

**Column Name:	Measurement_Name**
 * **Description:**	Holds the name of the standard deviation or mean measurement
 * **Type:**		Factor
 * **Values:**		86 possible values which are described in the table below to show which field from the original 'features data' they were obtained from.
 
  Value|Equivalent description from features data|Equivalent column number in features data
  -----|-----------------------------------------|-----------------------------------------
 Time_Body_Acceleration-mean-X|tBodyAcc-mean()-X|V1
 Time_Body_Acceleration-mean-Y|tBodyAcc-mean()-Y|V2
 Time_Body_Acceleration-mean-Z|tBodyAcc-mean()-Z|V3
 Time_Body_Acceleration-std-X|tBodyAcc-std()-X|V4
 Time_Body_Acceleration-std-Y|tBodyAcc-std()-Y|V5
 Time_Body_Acceleration-std-Z|tBodyAcc-std()-Z|V6
 Time_Gravity_Acceleration-mean-X|tGravityAcc-mean()-X|V41
 Time_Gravity_Acceleration-mean-Y|tGravityAcc-mean()-Y|V42
 Time_Gravity_Acceleration-mean-Z|tGravityAcc-mean()-Z|V43
 Time_Gravity_Acceleration-std-X|tGravityAcc-std()-X|V44
 Time_Gravity_Acceleration-std-Y|tGravityAcc-std()-Y|V45
 Time_Gravity_Acceleration-std-Z|tGravityAcc-std()-Z|V46
 Time_Body_Acceleration_Jerk-mean-X|tBodyAccJerk-mean()-X|V81
 Time_Body_Acceleration_Jerk-mean-Y|tBodyAccJerk-mean()-Y|V82
 Time_Body_Acceleration_Jerk-mean-Z|tBodyAccJerk-mean()-Z|V83
 Time_Body_Acceleration_Jerk-std-X|tBodyAccJerk-std()-X|V84
 Time_Body_Acceleration_Jerk-std-Y|tBodyAccJerk-std()-Y|V85
 Time_Body_Acceleration_Jerk-std-Z|tBodyAccJerk-std()-Z|V86
 Time_Body_Gyro-mean-X|tBodyGyro-mean()-X|V121
 Time_Body_Gyro-mean-Y|tBodyGyro-mean()-Y|V122
 Time_Body_Gyro-mean-Z|tBodyGyro-mean()-Z|V123
 Time_Body_Gyro-std-X|tBodyGyro-std()-X|V124
 Time_Body_Gyro-std-Y|tBodyGyro-std()-Y|V125
 Time_Body_Gyro-std-Z|tBodyGyro-std()-Z|V126
 Time_Body_GyroJerk-mean-X|tBodyGyroJerk-mean()-X|V161
 Time_Body_GyroJerk-mean-Y|tBodyGyroJerk-mean()-Y|V162
 Time_Body_GyroJerk-mean-Z|tBodyGyroJerk-mean()-Z|V163
 Time_Body_GyroJerk-std-X|tBodyGyroJerk-std()-X|V164
 Time_Body_GyroJerk-std-Y|tBodyGyroJerk-std()-Y|V165
 Time_Body_GyroJerk-std-Z|tBodyGyroJerk-std()-Z|V166
 Time_Body_Acceleration_Magnitude-mean|tBodyAccMag-mean()|V201
 Time_Body_Acceleration_Magnitude-std|tBodyAccMag-std()|V202
 Time_Gravity_Acceleration_Magnitude-mean|tGravityAccMag-mean()|V214
 Time_Gravity_Acceleration_Magnitude-std|tGravityAccMag-std()|V215
 Time_Body_Acceleration_JerkMagnitude-mean|tBodyAccJerkMag-mean()|V227
 Time_Body_Acceleration_JerkMagnitude-std|tBodyAccJerkMag-std()|V228
 Time_Body_GyroMagnitude-mean|tBodyGyroMag-mean()|V240
 Time_Body_GyroMagnitude-std|tBodyGyroMag-std()|V241
 Time_Body_GyroJerkMagnitude-mean|tBodyGyroJerkMag-mean()|V253
 Time_Body_GyroJerkMagnitude-std|tBodyGyroJerkMag-std()|V254
 Freq_Body_Acceleration-mean-X|fBodyAcc-mean()-X|V266
 Freq_Body_Acceleration-mean-Y|fBodyAcc-mean()-Y|V267
 Freq_Body_Acceleration-mean-Z|fBodyAcc-mean()-Z|V268
 Freq_Body_Acceleration-std-X|fBodyAcc-std()-X|V269
 Freq_Body_Acceleration-std-Y|fBodyAcc-std()-Y|V270
 Freq_Body_Acceleration-std-Z|fBodyAcc-std()-Z|V271
 Freq_Body_Acceleration-meanFreq-X|fBodyAcc-meanFreq()-X|V294
 Freq_Body_Acceleration-meanFreq-Y|fBodyAcc-meanFreq()-Y|V295
 Freq_Body_Acceleration-meanFreq-Z|fBodyAcc-meanFreq()-Z|V296
 Freq_Body_Acceleration_Jerk-mean-X|fBodyAccJerk-mean()-X|V345
 Freq_Body_Acceleration_Jerk-mean-Y|fBodyAccJerk-mean()-Y|V346
 Freq_Body_Acceleration_Jerk-mean-Z|fBodyAccJerk-mean()-Z|V347
 Freq_Body_Acceleration_Jerk-std-X|fBodyAccJerk-std()-X|V348
 Freq_Body_Acceleration_Jerk-std-Y|fBodyAccJerk-std()-Y|V349
 Freq_Body_Acceleration_Jerk-std-Z|fBodyAccJerk-std()-Z|V350
 Freq_Body_Acceleration_Jerk-meanFreq-X|fBodyAccJerk-meanFreq()-X|V373
 Freq_Body_Acceleration_Jerk-meanFreq-Y|fBodyAccJerk-meanFreq()-Y|V374
 Freq_Body_Acceleration_Jerk-meanFreq-Z|fBodyAccJerk-meanFreq()-Z|V375
 Freq_Body_Gyro-mean-X|fBodyGyro-mean()-X|V424
 Freq_Body_Gyro-mean-Y|fBodyGyro-mean()-Y|V425
 Freq_Body_Gyro-mean-Z|fBodyGyro-mean()-Z|V426
 Freq_Body_Gyro-std-X|fBodyGyro-std()-X|V427
 Freq_Body_Gyro-std-Y|fBodyGyro-std()-Y|V428
 Freq_Body_Gyro-std-Z|fBodyGyro-std()-Z|V429
 Freq_Body_Gyro-meanFreq-X|fBodyGyro-meanFreq()-X|V452
 Freq_Body_Gyro-meanFreq-Y|fBodyGyro-meanFreq()-Y|V453
 Freq_Body_Gyro-meanFreq-Z|fBodyGyro-meanFreq()-Z|V454
 Freq_Body_Acceleration_Magnitude-mean|fBodyAccMag-mean()|V503
 Freq_Body_Acceleration_Magnitude-std|fBodyAccMag-std()|V504
 Freq_Body_Acceleration_Magnitude-meanFreq|fBodyAccMag-meanFreq()|V513
 Freq_Body_Acceleration_JerkMagnitude-mean|fBodyBodyAccJerkMag-mean()|V516
 Freq_Body_Acceleration_JerkMagnitude-std|fBodyBodyAccJerkMag-std()|V517
 Freq_Body_Acceleration_JerkMagnitude-meanFreq|fBodyBodyAccJerkMag-meanFreq()|V526
 Freq_Body_GyroMagnitude-mean|fBodyBodyGyroMag-mean()|V529
 Freq_Body_GyroMagnitude-std|fBodyBodyGyroMag-std()|V530
 Freq_Body_GyroMagnitude-meanFreq|fBodyBodyGyroMag-meanFreq()|V539
 Freq_Body_GyroJerkMagnitude-mean|fBodyBodyGyroJerkMag-mean()|V542
 Freq_Body_GyroJerkMagnitude-std|fBodyBodyGyroJerkMag-std()|V543
 Freq_Body_GyroJerkMagnitude-meanFreq|fBodyBodyGyroJerkMag-meanFreq()|V552
 angle(Time_Body_Acceleration_Mean,gravity)|angle(tBodyAccMean,gravity)|V555
 angle(Time_Body_Acceleration_JerkMean),gravityMean)|angle(tBodyAccJerkMean),gravityMean)|V556
 angle(Time_Body_GyroMean,gravityMean)|angle(tBodyGyroMean,gravityMean)|V557
 angle(Time_Body_GyroJerkMean,gravityMean)|angle(tBodyGyroJerkMean,gravityMean)|V558
 angle(X,gravityMean)|angle(X,gravityMean)|V559
 angle(Y,gravityMean)|angle(Y,gravityMean)|V560
 angle(Z,gravityMean)|angle(Z,gravityMean)|V561 


## 2. avg_data_tall  
(this is the final dataset that is output as a text file called 'Project_Step5_Average_Data.txt')
---------------
**Description:**	The avg_data_tall dataset holds the average values for each subject & activity.

**Structure:**		A tall, narrow dataset with just 4 columns.

**Columns:**  Subject ID, Activity, Measurement_Name, Mean.

These columns have the same structure as described for the all_data_tall dataset above so descriptions are not included again here.

The only difference is that instead of individual *Measurement_Values* (as in all_data_tall), we now have a *Mean* column that is the average of the Measure_Values for that subject & Activity. 
