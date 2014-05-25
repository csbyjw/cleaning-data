library(reshape2)

# Loading test data

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

# Loading training data

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

# Loading labels

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Loading subject data and merge

subject_test 	<- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train 	<- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_all 	<- rbind(subject_test, subject_train)

# Loading feature names and assigning them

features <- read.table("UCI HAR Dataset/features.txt")
headers  <- features[,2]
names(X_test)  <- headers
names(X_train) <- headers

# Extracting mean and std headers

mean_std         <- grepl("mean\\(\\)|std\\(\\)", headers)
X_test_mean_std  <- X_test[,mean_std]
X_train_mean_std <- X_train[,mean_std]


# Merge all test and train rows

X_all <- rbind(X_test_mean_std, X_train_mean_std)
y_all <- rbind(y_test, y_train)


# Combine data

merged <- cbind(subject_all, y_all, X_all)
names(merged)[1] <- "SubjectID"
names(merged)[2] <- "Activity"

# Aggregate the data and assign labels
final_data <- aggregate(. ~ SubjectID + Activity, data=merged, FUN = mean)
final_data$Activity <- factor(final_data$Activity, labels=activity_labels[,2])

write.table(final_data, file="./tidydataset.txt", sep="\t", row.names=FALSE)