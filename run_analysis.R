library(plyr)

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
features <- read.table("UCI HAR Dataset/features.txt")
## reads test and train datasets and assigns to objects of the same names

colnames(x_test) <- features[, 2]
colnames(x_train) <- features[, 2]
##applies features to the column names of the x data sets

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
for (i in 1:nrow(y_test)) {
        y_test[i, ] <- as.character(activity_labels[as.numeric(y_test[i, ]), 2])
}
for (i in 1:nrow(y_train)) {
        y_train[i, ] <- as.character(activity_labels[as.numeric(y_train[i, ]), 2])
}
##applies the corresponding activity label to the y data sets

extract_columns <- features[grepl("-mean()|-std()", features[, 2]), 2]
extract_x_test <- x_test[, extract_columns]
extract_x_train <- x_train[, extract_columns]
## extracts columns for mean and std values only

colnames(y_test) <- "activity"
colnames(y_train) <- "activity"
colnames(subject_test) <- "subject"
colnames(subject_train) <- "subject"
#assign subject and activity column names

test_data <- cbind(subject_test, as.character(y_test), extract_x_test)
train_data <- cbind(subject_train, as.character(y_train), extract_x_train)
## binds columns from the two sets together

merged_data <- rbind(test_data, train_data)
## merging all data together

averages_data <- ddply(merged_data, .(subject, activity), function(x) colMeans(x[, 3:81]))
## uses ddply to splits the data up by subject and activity, calculate the mean, and return a new table

write.table(averages_data, "averages_data.txt", row.name=FALSE)