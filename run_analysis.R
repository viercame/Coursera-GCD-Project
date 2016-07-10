run_analysis <- function(){
  
  setwd("H:/Vicente/Estudios/Data scientist/R/Data cleaning/Project")
  
  if (!require("stringr")){
    install.packages("stringr", dependencies=TRUE)
  }
  
  library("stringr")
  
  if (!require("data.table")){
    install.packages("data.table", dependencies=TRUE)
  }
  
  library("data.table")
  
  
  
  #Part 1
  X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
  Y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
  
  X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
  Y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
  
  activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
  features <- read.table("UCI HAR Dataset/features.txt")[,2]
  
  Y_test[,2] = activity_labels[Y_test[,1]]
  Y_train[,2] = activity_labels[Y_train[,1]]
 
  
  #merge the data
  
  subject<- rbind(subject_train, subject_test)
  Y <- rbind(Y_train, Y_test)
  X <- rbind(X_train, X_test)
  
  # asignar nombres a columnas
  
  names(X)= features
  names(Y) =c("Training Code", "Traininglabel")
  names(subject) = "Subject"
  
  all_data <- cbind(X,Y, subject)
  
  #Part2
  
  Columns_mean_std <- grep("*mean*|*std*", names(all_data), ignore.case = TRUE)
  
  Extracted_columns <- c(Columns_mean_std,563, 564)
  
  data <- all_data[, Extracted_columns]
  print(names(data))
  print (dim(data))
  
  #part3 - Uses descriptive activity names to name the activities in the data set
  # It was made it, in the part 1, when Y_train[,2] = activity_labels[Y_train[,1]] and Y_test[,2] = activity_labels[Y_test[,1]]
  # using the labels defined in the data set : Levels: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS
  
  print(activity_labels)
  
  #part 4 - Appropriately labels the data set with descriptive variable names.
  
  names(data) <- str_replace_all(names(data), "([A-Z]{1})", " \\1")

  names(data)<-gsub("Acc", "Accelerometer", names(data))
  names(data)<-gsub("Gyro", "Gyroscope", names(data))
  names(data)<-gsub("BodyBody", "Body", names(data))
  names(data)<-gsub("Mag", "Magnitude", names(data))
  names(data)<-gsub("^t", "Time", names(data))
  names(data)<-gsub("^f", "Frequency", names(data))
  names(data)<-gsub("tBody", "TimeBody", names(data))
  names(data)<-gsub("-mean()", " Mean", names(data), ignore.case = TRUE)
  names(data)<-gsub("-std()", " STD", names(data), ignore.case = TRUE)
  names(data)<-gsub("-freq()", " Frequency", names(data), ignore.case = TRUE)
  names(data)<-gsub("angle", "Angle", names(data))
  names(data)<-gsub("gravity", "Gravity", names(data))
  
  print(names(data))
  
  #part 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
  data.dt <- data.table(data)
  
  TidyData <- data.dt[,lapply(.SD, mean), by = ' Subject, Traininglabel']
  
  write.table(TidyData, file ="Tidy.txt", row.names = FALSE)
  
}