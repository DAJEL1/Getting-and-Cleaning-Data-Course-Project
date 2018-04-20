
rm(list = ls())

## Reading all necessary files from test and training folders

    xtest <- read.table("X_test.txt")

    ytest <- read.table("y_test.txt")

   xtrain <- read.table("X_train.txt")

   ytrain <- read.table("y_train.txt")

 features <- read.table("features.txt")

 subjtest <- read.table("subject_test.txt")

subjtrain <- read.table("subject_train.txt")

actlabels <- read.table("activity_labels.txt") 

## 1 -- Merging test and training sets

       mgds <- merge(xtest, xtrain, all = TRUE)
       
   ## rename the columns variables of mgds data set

names(mgds) <- features$V2

## 2 -- Extracting only the measurements on mean and standard deviation 

meancols <- grep("mean\\(\\)", colnames(mgds), value = TRUE)

 stdcols <- grep("std\\(\\)", colnames(mgds), value = TRUE)

  xtmean <- mgds[meancols]

   xtstd <- mgds[stdcols]

    xtds <- as.data.table(cbind.data.frame(xtmean, xtstd)) 

## 3 -- Apply descriptive activity names in the data set

rnames <- tolower(names(xtds))

rnames <- gsub("-", "", rnames)

rnames <- gsub("\\(\\)", "", rnames)

names(xtds) <- rnames

## 4-- Appropriately labels the data set with descriptive variable names

activity <- rbind(ytest, ytrain)

names(activity) <- "activities"

lbds <- as.data.table(cbind(activity, xtds))

## convert activities columns from interger to factor

lbds$activities <- factor(lbds$activities, labels = c("Walking", "WalkingUpStairs", "WalkingDownStairs","Sitting","Standing", "Laying"))

## 5-- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Create the subject data frame
   
subject <- rbind(subjtest, subjtrain)

## rename the column variable to subjectID 

names(subject) <- "subjectID"

## Add subjectID to lbds data set

lbds <- cbind(subject, lbds)

## Create a melted data set

meltds <- melt(lbds, id = c("subjectID","activities"))

## Create the independent tidy data set

tidyds <- dcast(meltds, subjectID+activities ~ variable, mean)

## write tidy data set to a file

write.table(tidyds, file = "tidyds.txt", row.names = FALSE, append = FALSE, quote = TRUE, sep = " ",
            eol = "\n", na = "NA", dec = ".", col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")





