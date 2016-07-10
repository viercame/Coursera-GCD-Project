# Coursera-GCD-Project

## run_analysis.R

The script is divided y five parts, according with the project.

The script performs the following actions, in general terms:

1. Prepare work directory and dependances

2. Read the zips.

3. Combine the *Y_tables* with the *activity_labels*. To define the names of the activities.

4. Merge data.
* Merge *subject_tables* using `rbind()`
* Merge *X_tables* and *Y_tables* using `rbind()`
* Merge all tables (X,Y and subject) in one, using `cbind()`

5. Extract the columns with the *mean* and *std* words.

6. Cleans the variable names to human readable form
7. Creates the tiny data set with the average of each variable for each activity and each subject.
 
The details are documented in CodeBook.md

##CodeBook.md

The CodeBook.md contains the detail about the variables and its data transmforming process.
