**Getting and cleaning data course project repository.**

The repo contains following files:

 - README.md - this file;
 - run_analysis.R - R-script with the project task;
 - result.txt - saved result data set;
 - codebook.txt - the file describing the variables.

To make the script run_analysis.R work properly the folder 'UCI HAR Dataset' should be unzipped to the R working directory. The package 'dplyr' will be used in the script.

How the script works:
First of all the script reads column names from the file features.txt and assign vector to the 'features' variable.
```{r}
        library(dplyr)
        ##reading column names into the vector named features
        features <- read.table("UCI HAR Dataset\\features.txt")
        features <- features$V2
```

Then we read the following:
                - test data from 'test\X_test.txt' into 'test_data' data set;
                - test activity labels IDs from 'test\y_test.txt' into 'test_label'data set;
                - test subject IDs from 'test\subject_test.txt' into 'test_subject' data set.
Afer all we add activity and subject data as particular columns to the 'test_data' data set.                
```{r}
        ##reading test data
        message("reading test dataset...")
        test_data <- read.table("UCI HAR Dataset\\test\\X_test.txt",col.names = features, header = FALSE)
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
```

With the same approach we read:
                - train data from 'train\X_train.txt' into 'train_data' data set;
                - train activity labels IDs from 'train\y_train.txt' into 'train_label'data set;
                - train subject IDs from 'train\subject_train.txt' into 'train_subject' data set.
Afer all we add activity and subject data as particular columns to the 'train_data' data set.      
```{r}
        ##reading train data
        message("reading train dataset...")
        train_data <- read.table("UCI HAR Dataset\\train\\X_train.txt",col.names = features, header = FALSE)        
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
```

Merging the training and the sest sets to create one 'mean_std' data set. Removing some variables from memory. 
```{r}
        ##merging data
        mean_std <- union(test_data,train_data)
        
        rm(test_data)
        rm(test_label)
        rm(test_subject)
        
        rm(train_data)
        rm(train_label)
        rm(train_subject)
```

Extracting only the measurements on the mean and standard deviation for each measurement.In 'mean_std' we left only the columns containing "mean" and "std" in their names. Columns 'Activity' and 'SubjectID' are left as well.
```{r}
        ##extracting only the measurements on the mean and standard deviation for each measurement. 
        mean_std <- select(mean_std, contains("Activity"), contains("SubjectID"), contains("mean"),contains("std"))
```

Adding descriptive activity names to name the activities in the data set. To do that we read activity description from 'activity_labels.txt' and changed the type of 'Activity' column to factor adding activity labels.
```{r}
        ##reading activity labels
        labels <- read.table("UCI HAR Dataset\\activity_labels.txt",header = FALSE, 
                             col.names = c("ActivityID","Activity"))
        
        ##adding descriptive activity names to name the activities in the data set
        mean_std$Activity <- factor(mean_std$Activity, levels = labels$ActivityID, labels = labels$Activity)
```

Making column names more easy to read.
```{r}
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
```

Creating tidy data set 'result_dataset' with the average of each variable for each activity and each subject. Writing 'result_dataset' to the 'result.txt' file.
```{r}
        ##Grouping and summarising. Calculating the average of each variable for each activity and each subject
        result_dataset <- group_by(mean_std,Activity,SubjectID)
        result_dataset <- summarise_each(result_dataset, funs(mean))
                
        ##Saving result_dataset to the file
        message("Writing dataset to result.txt....")
        write.table(result_dataset,"result.txt",row.names = FALSE)
        
        message("The datasets are ready. The names are mean_std and result_dataset")
```
