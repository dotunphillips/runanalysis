library(tidyverse)

# Load the features names which is used to name columns for the features (X) data set
features <- read_table("features.txt", col_names = c("feature_id", "feature"))

# Load features data from the test and training data set
testX <- read_table("test/X_test.txt", col_names = features$feature )
trainX <- read_table("train/X_train.txt", col_names = features$feature )

# Load the activity data
labels <- read_table("activity_labels.txt", col_names = c("activity_id", "activity"))

# Load activity (target) data from the test and training data set
testY <- read_table("test/Y_test.txt", col_names = "activity_id" )
trainY <- read_table("train/Y_train.txt", col_names = "activity_id" )

# Load subject data from the test and training data set
testSubject <- read_table("test/subject_test.txt", col_names = "subject")
trainSubject <- read_table("train/subject_train.txt", col_names = "subject")

# Combined test & training set into one activities (target) data set
# Replace the activity_id with the activity name
activities <- union_all(testY, trainY)
activities <- as.factor(inner_join(activities, labels)$activity)

# Combined test & training set into one subjects data set
subjects <- union_all(testSubject, trainSubject)

# Combined test & training set into one features (X) data set
features <- union_all(testX, trainX)


# Combined the activities, subjects, and features into one data set
# Only display data with the mean and std features 
final <- cbind(subjects, activities, features)
final <- select(final, subject, activities, contains("mean"), contains("std"))

# Change some columns to a more descriptive name
names(final)<-gsub("^t", "Time", names(final))
names(final)<-gsub("^f", "Frequency", names(final))
final_agg_data <- group_by(final, subject, activities) %>% 
  summarize_all("mean")

# Writes the final tidy data to a file
write_csv(final_agg_data, "final_data.csv")
