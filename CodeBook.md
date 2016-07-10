#CodeBook

##Data Transformation

### Part1 - Merges the training and the test sets to create one data set.
The files *X_test.txt, y_test.txt, X_train.txt, y_train.txt, subject_test.txt, subject_train.txt, activity_labels.txt* and *features.txt* are loaded as data tables, using read.table function. 

The X_tables  are combined via ```rbind()```.

The y_tables are merged with *activity_labels.txt* via ```Y_test[,2] = activity_labels[Y_test[,1]]```, and assign the colnames "Training Code" and "Traininglabel" as follows:


 Training Code |   Traininglabel  
 --------------|-----------------
  1            |WALKING          
  2            |          WALKING_UPSTAIRS
  3            |          WALKING_DOWNSTAIRS
  4            |          SITTING
  5            |          STANDING
  6            |          LAYING

The column names of X_tables is assigned```names(X)= features```

At the end the *X_tables, Y_tables* and *subject_tables* are merged via ```cbind()```.

### Part2 - Extracts only the measurements on the mean and standard deviation for each measurement.

Obtain all columns with *mean* or *std* words in the column names. 
Define a vector with the columns with *mean, std* words, and the columns *563* and *564* = "Traininglabel"  an "Subject"

The extracted columns are assigned to a data.table, named **data**

The colmun names of **data** as follows:

item | name
---- | ----
 [1] | "tBodyAcc-mean()-X"                   
 [2]| "tBodyAcc-mean()-Y"                   
 [3]| "tBodyAcc-mean()-Z"                   
 [4]| "tBodyAcc-std()-X"                    
 [5]| "tBodyAcc-std()-Y"                    
 [6]| "tBodyAcc-std()-Z"                    
 [7]| "tGravityAcc-mean()-X"                
 [8]| "tGravityAcc-mean()-Y"                
 [9]| "tGravityAcc-mean()-Z"                
[10]| "tGravityAcc-std()-X"                 
[11]| "tGravityAcc-std()-Y"                 
[12]| "tGravityAcc-std()-Z"                 
[13]| "tBodyAccJerk-mean()-X"               
[14]| "tBodyAccJerk-mean()-Y"               
[15]| "tBodyAccJerk-mean()-Z"               
[16]| "tBodyAccJerk-std()-X"                
[17]| "tBodyAccJerk-std()-Y"                
[18]| "tBodyAccJerk-std()-Z"                
[19]| "tBodyGyro-mean()-X"                  
[20]| "tBodyGyro-mean()-Y"                  
[21]| "tBodyGyro-mean()-Z"                  
[22]| "tBodyGyro-std()-X"                   
[23]| "tBodyGyro-std()-Y"                   
[24]| "tBodyGyro-std()-Z"                   
[25]| "tBodyGyroJerk-mean()-X"              
[26]| "tBodyGyroJerk-mean()-Y"              
[27]|"tBodyGyroJerk-mean()-Z"              
[28]| "tBodyGyroJerk-std()-X"               
[29]| "tBodyGyroJerk-std()-Y"               
[30]| "tBodyGyroJerk-std()-Z"               
[31]| "tBodyAccMag-mean()"                  
[32]| "tBodyAccMag-std()"                   
[33]| "tGravityAccMag-mean()"               
[34]|"tGravityAccMag-std()"                
[35]| "tBodyAccJerkMag-mean()"              
[36]| "tBodyAccJerkMag-std()"               
[37]| "tBodyGyroMag-mean()"                 
[38]| "tBodyGyroMag-std()"                  
[39]| "tBodyGyroJerkMag-mean()"             
[40]| "tBodyGyroJerkMag-std()"              
[41]| "fBodyAcc-mean()-X"                   
[42]| "fBodyAcc-mean()-Y"                   
[43]| "fBodyAcc-mean()-Z"                   
[44]| "fBodyAcc-std()-X"                    
[45]| "fBodyAcc-std()-Y"                    
[46]| "fBodyAcc-std()-Z"                    
[47]| "fBodyAcc-meanFreq()-X"               
[48]| "fBodyAcc-meanFreq()-Y"               
[49]| "fBodyAcc-meanFreq()-Z"               
[50]| "fBodyAccJerk-mean()-X"               
[51]| "fBodyAccJerk-mean()-Y"               
[52]| "fBodyAccJerk-mean()-Z"               
[53]| "fBodyAccJerk-std()-X"                
[54]| "fBodyAccJerk-std()-Y"                
[55]| "fBodyAccJerk-std()-Z"                
[56]| "fBodyAccJerk-meanFreq()-X"           
[57]| "fBodyAccJerk-meanFreq()-Y"           
[58]| "fBodyAccJerk-meanFreq()-Z"           
[59]| "fBodyGyro-mean()-X"                  
[60]| "fBodyGyro-mean()-Y"                  
[61]| "fBodyGyro-mean()-Z"                  
[62]| "fBodyGyro-std()-X"                   
[63] |"fBodyGyro-std()-Y"                   
[64] |"fBodyGyro-std()-Z"                   
[65]| "fBodyGyro-meanFreq()-X"              
[66]| "fBodyGyro-meanFreq()-Y"              
[67]| "fBodyGyro-meanFreq()-Z"              
[68]| "fBodyAccMag-mean()"                  
[69]| "fBodyAccMag-std()"                   
[70]| "fBodyAccMag-meanFreq()"              
[71]| "fBodyBodyAccJerkMag-mean()"          
[72]| "fBodyBodyAccJerkMag-std()"           
[73]| "fBodyBodyAccJerkMag-meanFreq()"      
[74]| "fBodyBodyGyroMag-mean()"             
[75]| "fBodyBodyGyroMag-std()"              
[76]| "fBodyBodyGyroMag-meanFreq()"         
[77] |"fBodyBodyGyroJerkMag-mean()"         
[78]| "fBodyBodyGyroJerkMag-std()"          
[79]| "fBodyBodyGyroJerkMag-meanFreq()"     
[80]| "angle(tBodyAccMean,gravity)"         
[81]| "angle(tBodyAccJerkMean),gravityMean)"
[82]| "angle(tBodyGyroMean,gravityMean)"    
[83]| "angle(tBodyGyroJerkMean,gravityMean)"
[84]| "angle(X,gravityMean)"                
[85] |"angle(Y,gravityMean)"                
[86] |"angle(Z,gravityMean)"                
[87]| "Traininglabel"                       
[88]| "Subject"

### Part3 - Uses descriptive activity names to name the activities in the data set

In Part1 the descriptive activity name was dfined in the data set, as follows:

item | description
---- | -----------
[1] | WALKING
[2] | WALKING_UPSTAIRS
[3] | WALKING_DOWNSTAIRS
[4] | SITTING
[5] | STANDING
[6] | LAYING    

### Part4 - Appropriately labels the data set with descriptive variable names

The column names of the data are changed, as follows:


item| Old Name            | New Name
----| --------------------|-----------
[1] | "tBodyAcc-mean()-X" | "Time Body Accelerometer Mean()- X"
[2] | "tBodyAcc-mean()-Y" | "Time Body Accelerometer Mean()- Y"
[3] | "tBodyAcc-mean()-Z" | "Time Body Accelerometer Mean()- Z"
[4] | "tBodyAcc-std()-X" | "Time Body Accelerometer STD()- X"
[5] | "tBodyAcc-std()-Y" | "Time Body Accelerometer STD()- Y"
[6] | "tBodyAcc-std()-Z" | "Time Body Accelerometer STD()- Z"
[7] | "tGravityAcc-mean()-X" | "Time Gravity Accelerometer Mean()- X"
[8] | "tGravityAcc-mean()-Y" | "Time Gravity Accelerometer Mean()- Y"
[9] | "tGravityAcc-mean()-Z" | "Time Gravity Accelerometer Mean()- Z"
[10] | "tGravityAcc-std()-X" | "Time Gravity Accelerometer STD()- X"
[11] | "tGravityAcc-std()-Y" | "Time Gravity Accelerometer STD()- Y"
[12] | "tGravityAcc-std()-Z" | "Time Gravity Accelerometer STD()- Z"
[13] | "tBodyAccJerk-mean()-X" | "Time Body Accelerometer Jerk Mean()- X"
[14] | "tBodyAccJerk-mean()-Y" | "Time Body Accelerometer Jerk Mean()- Y"
[15] | "tBodyAccJerk-mean()-Z" | "Time Body Accelerometer Jerk Mean()- Z"
[16] | "tBodyAccJerk-std()-X" | "Time Body Accelerometer Jerk STD()- X"
[17] | "tBodyAccJerk-std()-Y" | "Time Body Accelerometer Jerk STD()- Y"
[18] | "tBodyAccJerk-std()-Z" | "Time Body Accelerometer Jerk STD()- Z"
[19] | "tBodyGyro-mean()-X" | "Time Body Gyroscope Mean()- X"
[20] | "tBodyGyro-mean()-Y" | "Time Body Gyroscope Mean()- Y"
[21] | "tBodyGyro-mean()-Z" | "Time Body Gyroscope Mean()- Z"
[22] | "tBodyGyro-std()-X" | "Time Body Gyroscope STD()- X"
[23] | "tBodyGyro-std()-Y" | "Time Body Gyroscope STD()- Y"
[24] | "tBodyGyro-std()-Z" | "Time Body Gyroscope STD()- Z"
[25] | "tBodyGyroJerk-mean()-X" | "Time Body Gyroscope Jerk Mean()- X"
[26] | "tBodyGyroJerk-mean()-Y" | "Time Body Gyroscope Jerk Mean()- Y"
[27] | "tBodyGyroJerk-mean()-Z" | "Time Body Gyroscope Jerk Mean()- Z"
[28] | "tBodyGyroJerk-std()-X" | "Time Body Gyroscope Jerk STD()- X"
[29] | "tBodyGyroJerk-std()-Y" | "Time Body Gyroscope Jerk STD()- Y"
[30] | "tBodyGyroJerk-std()-Z" | "Time Body Gyroscope Jerk STD()- Z"
[31] | "tBodyAccMag-mean()" | "Time Body Accelerometer Magnitude Mean()"
[32] | "tBodyAccMag-std()" | "Time Body Accelerometer Magnitude STD()"
[33] | "tGravityAccMag-mean()" | "Time Gravity Accelerometer Magnitude Mean()"
[34] | "tGravityAccMag-std()" | "Time Gravity Accelerometer Magnitude STD()"
[35] | "tBodyAccJerkMag-mean()" | "Time Body Accelerometer Jerk Magnitude Mean()"
[36] | "tBodyAccJerkMag-std()" | "Time Body Accelerometer Jerk Magnitude STD()"
[37] | "tBodyGyroMag-mean()" | "Time Body Gyroscope Magnitude Mean()"
[38] | "tBodyGyroMag-std()" | "Time Body Gyroscope Magnitude STD()"
[39] | "tBodyGyroJerkMag-mean()" | "Time Body Gyroscope Jerk Magnitude Mean()"
[40] | "tBodyGyroJerkMag-std()" | "Time Body Gyroscope Jerk Magnitude STD()"
[41] | "fBodyAcc-mean()-X" | "Frequency Body Accelerometer Mean()- X"
[42] | "fBodyAcc-mean()-Y" | "Frequency Body Accelerometer Mean()- Y"
[43] | "fBodyAcc-mean()-Z" | "Frequency Body Accelerometer Mean()- Z"
[44] | "fBodyAcc-std()-X" | "Frequency Body Accelerometer STD()- X"
[45] | "fBodyAcc-std()-Y" | "Frequency Body Accelerometer STD()- Y"
[46] | "fBodyAcc-std()-Z" | "Frequency Body Accelerometer STD()- Z"
[47] | "fBodyAcc-meanFreq()-X" | "Frequency Body Accelerometer Mean Freq()- X"
[48] | "fBodyAcc-meanFreq()-Y" | "Frequency Body Accelerometer Mean Freq()- Y"
[49] | "fBodyAcc-meanFreq()-Z" | "Frequency Body Accelerometer Mean Freq()- Z"
[50] | "fBodyAccJerk-mean()-X" | "Frequency Body Accelerometer Jerk Mean()- X"
[51] | "fBodyAccJerk-mean()-Y" | "Frequency Body Accelerometer Jerk Mean()- Y"
[52] | "fBodyAccJerk-mean()-Z" | "Frequency Body Accelerometer Jerk Mean()- Z"
[53] | "fBodyAccJerk-std()-X" | "Frequency Body Accelerometer Jerk STD()- X"
[54] | "fBodyAccJerk-std()-Y" | "Frequency Body Accelerometer Jerk STD()- Y"
[55] | "fBodyAccJerk-std()-Z" | "Frequency Body Accelerometer Jerk STD()- Z"
[56] | "fBodyAccJerk-meanFreq()-X" | "Frequency Body Accelerometer Jerk Mean Freq()-X"
[57] | "fBodyAccJerk-meanFreq()-Y" | "Frequency Body Accelerometer Jerk Mean Freq()-Y"
[58] | "fBodyAccJerk-meanFreq()-Z" | "Frequency Body Accelerometer Jerk Mean Freq()-Z"
[59] | "fBodyGyro-mean()-X" | "Frequency Body Gyroscope Mean()- X"
[60] | "fBodyGyro-mean()-Y" | "Frequency Body Gyroscope Mean()- Y"
[61] | "fBodyGyro-mean()-Z" | "Frequency Body Gyroscope Mean()- Z"
[62] | "fBodyGyro-std()-X" | "Frequency Body Gyroscope STD()- X"
[63] | "fBodyGyro-std()-Y" | "Frequency Body Gyroscope STD()- Y"
[64] | "fBodyGyro-std()-Z" | "Frequency Body Gyroscope STD()- Z"
[65] | "fBodyGyro-meanFreq()-X" | "Frequency Body Gyroscope Mean Freq()- X"
[66] | "fBodyGyro-meanFreq()-Y" | "Frequency Body Gyroscope Mean Freq()- Y"
[67] | "fBodyGyro-meanFreq()-Z" | "Frequency Body Gyroscope Mean Freq()- Z"
[68] | "fBodyAccMag-mean()" | "Frequency Body Accelerometer Magnitude Mean()"
[69] | "fBodyAccMag-std()" | "Frequency Body Accelerometer Magnitude STD()"
[70] | "fBodyAccMag-meanFreq()" | "Frequency Body Accelerometer Magnitude Mean Freq()"
[71] | "fBodyBodyAccJerkMag-mean()" | "Frequency Body Body Accelerometer Jerk Magnitude Mean()"
[72] | "fBodyBodyAccJerkMag-std()" | "Frequency Body Body Accelerometer Jerk Magnitude STD()"
[73] | "fBodyBodyAccJerkMag-meanFreq()" | "Frequency Body Body Accelerometer Jerk Magnitude Mean Freq()"
[74] | "fBodyBodyGyroMag-mean()" | "Frequency Body Body Gyroscope Magnitude Mean()"
[75] | "fBodyBodyGyroMag-std()" | "Frequency Body Body Gyroscope Magnitude STD()"
[76] | "fBodyBodyGyroMag-meanFreq()" | "Frequency Body Body Gyroscope Magnitude Mean Freq()"
[77] | "fBodyBodyGyroJerkMag-mean()" | "Frequency Body Body Gyroscope Jerk Magnitude Mean()"
[78] | "fBodyBodyGyroJerkMag-std()" | "Frequency Body Body Gyroscope Jerk Magnitude STD()"
[79] | "fBodyBodyGyroJerkMag-meanFreq()" | "Frequency Body Body Gyroscope Jerk Magnitude Mean Freq()"
[80] | "angle(tBodyAccMean,gravity)" | "Angle(t Body Accelerometer Mean,Gravity)"
[81] | "angle(tBodyAccJerkMean),gravityMean)" | "Angle(t Body Accelerometer Jerk Mean),GravityMean)"
[82] | "angle(tBodyGyroMean,gravityMean)" | "Angle(t Body Gyroscope Mean,Gravity Mean)"
[83] | "angle(tBodyGyroJerkMean,gravityMean)" | "Angle(t Body Gyroscope Jerk Mean,Gravity Mean)"
[84] | "angle(X,gravityMean)" | "Angle( X,Gravity Mean)"
[85] | "angle(Y,gravityMean)" | "Angle( Y,Gravity Mean)"
[86] | "angle(Z,gravityMean)" | "Angle( Z,Gravity Mean)"
[87] | "Traininglabel" | " Traininglabel"
[88] | "Subject" | " Subject"
