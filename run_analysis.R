        library(dplyr)
                
        ##reading column names into the vector named features
        features <- read.table("UCI HAR Dataset\\features.txt")
        features <- features$V2
        
        ##reading test data
        message("reading test dataset...")
        test_data <- read.table("UCI HAR Dataset\\test\\X_test.txt",col.names = features, header = FALSE, strip.white  = TRUE,skipNul = TRUE)        
        test_data <- tbl_df(test_data)
        test_data <- mutate(test_data, MeasureType = "test")

        #reading activity column for test dataset
        test_label <- read.table("UCI HAR Dataset\\test\\y_test.txt", header = FALSE)

        #reading subject column for test dataset
        test_subject <- read.table("UCI HAR Dataset\\test\\subject_test.txt", header = FALSE)
        
        ##adding columns to the test dataset
        test_data <- mutate(test_data, Activity = test_label[,1])
        test_data <- mutate(test_data, SubjectID = test_subject[,1])
        
        message("OK")
        
        ##reading train data
        message("reading train dataset...")
        train_data <- read.table("UCI HAR Dataset\\train\\X_train.txt",col.names = features, header = FALSE, strip.white  = TRUE,skipNul = TRUE)        
        train_data <- tbl_df(train_data)
        train_data <- mutate(train_data, MeasureType = "train")
        
        #reading activity labels for train dataset
        train_label <- read.table("UCI HAR Dataset\\train\\y_train.txt", header = FALSE)

        #reading subject column for test dataset
        train_subject <- read.table("UCI HAR Dataset\\train\\subject_train.txt", header = FALSE)
        
        ##adding columns to the train dataset
        train_data <- mutate(train_data, Activity = train_label[,1])
        train_data <- mutate(train_data, SubjectID = train_subject[,1])
        
        message("OK")
        
        ##merging data
        mean_std <- union(test_data,train_data)
        
        rm(test_data)
        rm(train_data)
        
        ##extracting only the measurements on the mean and standard deviation for each measurement. 
        mean_std <- select(mean_std, contains("Activity"), contains("SubjectID"), contains("mean"),contains("std"))
        
        ##reading activity labels
        labels <- read.table("UCI HAR Dataset\\activity_labels.txt",header = FALSE, col.names = c("ActivityID","Activity"))
        
        ##adding descriptive activity names to name the activities in the data set
        mean_std$Activity <- factor(mean_std$Activity, levels = labels$ActivityID, labels = labels$Activity)

        ##modifying column names with the descriptive variable names 
        names(mean_std) <-  gsub("tBody","TimeBody",names(mean_std))
        names(mean_std) <-  gsub("tAcc","TimeAcc",names(mean_std))
        names(mean_std) <-  gsub("tGravity","TimeGravity",names(mean_std))
        names(mean_std) <-  gsub("fBody","FFTBody",names(mean_std))
        names(mean_std) <-  gsub("fAcc","FFTAcc",names(mean_std))
        names(mean_std) <-  gsub(".std","Std",names(mean_std))
        names(mean_std) <-  gsub(".mean","Mean",names(mean_std))
        names(mean_std) <-  gsub(".gravity","Gravity",names(mean_std))
        names(mean_std) <-  gsub("angle.","Angle",names(mean_std))
        names(mean_std) <-  gsub(".","",names(mean_std),fixed = TRUE)

        
        ##Grouping and summarising. Calculating the average of each variable for each activity and each subject
        result_dataset <- group_by(mean_std,Activity,SubjectID)
        result_dataset <- summarise_each(result_dataset, funs(mean))
                
        ##Saving result_dataset to the file
        message("Writing dataset to result.txt....")
        write.table(result_dataset,"result.txt",row.names = FALSE)
        
        message("The datasets are ready. The names are mean_std and result_dataset")
        

