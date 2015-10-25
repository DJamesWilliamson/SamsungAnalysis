################################################################################
## PREPARATION
# Load necessary packages
library(readr)
library(stringr)
library(dplyr)

# This useful code was provided in the discussion forum by Richard Richter:
# list.of.packages <- c("readr", "stringr", "dplyr")
# new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
# if(length(new.packages)) install.packages(new.packages)
################################################################################
## SECTION A Used if files need to be downloaded before analysis
# 
# # Create working directory
# if(!file.exists("Samsung")) dir.create("Samsung")
# setwd("Samsung")
# 
# # Download and unzip dataset
# dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(dataset_url, "UCI_HAR_Dataset.zip")
# unzip("UCI_HAR_Dataset.zip", exdir = "UCI_HAR_Dataset")
# file.remove("UCI_HAR_Dataset.zip")
# 
# # Record date downloaded
# dateDownloaded <- date()
# 
# # Check that files are there
# list.files()
# files_summary <- list.files(path = "./UCI_HAR_Dataset/UCI HAR Dataset"
#                             , full.names = TRUE)
# files_train <- list.files(path = "./UCI_HAR_Dataset/UCI HAR Dataset/train"
#                           , full.names = TRUE)
# files_test <- list.files(path = "./UCI_HAR_Dataset/UCI HAR Dataset/test"
#                          , full.names = TRUE)
# files_summary
# files_train
# files_test
# 
# # Read in activity labels file
# activities.df <- read.table("./UCI_HAR_Dataset/UCI HAR Dataset/activity_labels.txt",
#                             sep = " ", nrow = 6, stringsAsFactors = FALSE)
# # activities.df
# # Read in features file
# features.df <- read.table("./UCI_HAR_Dataset/UCI HAR Dataset/features.txt",
#                           sep = " ", nrow = 561, stringsAsFactors = FALSE)
# # features.df
# # Read in subject_train file
# subject_train.df <- read.table("./UCI_HAR_Dataset/UCI HAR Dataset/train/subject_train.txt",
#                                sep = " ", stringsAsFactors = FALSE)
# # subject_train.df
# # Read in y_train file
# y_train.df <- read.table("./UCI_HAR_Dataset/UCI HAR Dataset/train/y_train.txt",
#                          sep = " ", stringsAsFactors = FALSE)
# # y_train.df
# # Read in subject_test file
# subject_test.df <- read.table("./UCI_HAR_Dataset/UCI HAR Dataset/test/subject_test.txt",
#                               sep = " ", stringsAsFactors = FALSE)
# # subject_test.df
# # Read in y_test file
# y_test.df <- read.table("./UCI_HAR_Dataset/UCI HAR Dataset/test/y_test.txt",
#                         sep = " ", stringsAsFactors = FALSE)
# # y_test.df
# 
# # Import fixed width files to R wd as data frames with readr
# # Read in X_train.txt file
# x_train.df <- read_fwf("./UCI_HAR_Dataset/UCI HAR Dataset/train/X_train.txt",
#                        skip = 0,
#                        fwf_positions(c(seq(from = 2, to = 8962, by = 16)),
#                                      c(seq(from = 16, to = 8976, by = 16))))
# # X_train.txt
# # Read in X_test.txt file
# x_test.df <- read_fwf("./UCI_HAR_Dataset/UCI HAR Dataset/test/X_test.txt",
#                       skip = 0,
#                       fwf_positions(c(seq(from = 2, to = 8962, by = 16)),
#                                     c(seq(from = 16, to = 8976, by = 16))))
# # X_test.txt

################################################################################
## SECTION B Used if the files are in the working directory
# The following files must be placed in the working directory:
# activity_labels.txt
# features.txt
# subject_train.txt
# y_train.txt
# subject_test.txt
# y_test.txt
# X_train.txt
# X_test.txt

# Read in activity labels file
activities.df <- read.table("activity_labels.txt",
                            sep = " ", nrow = 6, stringsAsFactors = FALSE)
# activities.df
# Read in features file
features.df <- read.table("features.txt",
                          sep = " ", nrow = 561, stringsAsFactors = FALSE)
# features.df
# Read in subject_train file
subject_train.df <- read.table("subject_train.txt",
                               sep = " ", stringsAsFactors = FALSE)
# subject_train.df
# Read in y_train file
y_train.df <- read.table("y_train.txt",
                         sep = " ", stringsAsFactors = FALSE)
# y_train.df
# Read in subject_test file
subject_test.df <- read.table("subject_test.txt",
                              sep = " ", stringsAsFactors = FALSE)
# subject_test.df
# Read in y_test file
y_test.df <- read.table("y_test.txt",
                        sep = " ", stringsAsFactors = FALSE)
# y_test.df

# Import fixed width files to R wd as data frames with readr
# Read in X_train.txt file
x_train.df <- read_fwf("X_train.txt",
                       skip = 0,
                       fwf_positions(c(seq(from = 2, to = 8962, by = 16)),
                                     c(seq(from = 16, to = 8976, by = 16))))
# x_train.df
# Read in X_test.txt file
x_test.df <- read_fwf("X_test.txt",
                      skip = 0,
                      fwf_positions(c(seq(from = 2, to = 8962, by = 16)),
                                    c(seq(from = 16, to = 8976, by = 16))))
# x_test.df

################################################################################
## SECTION C Common to both methods of data input

# Substitute activity labels
y_train.df$V1 <- as.factor(activities.df$V2[y_train.df$V1])
y_test.df$V1 <- as.factor(activities.df$V2[y_test.df$V1])

# Combine train and test activity files, then name variable "Activity"
activities_combo <- rbind(y_train.df, y_test.df)
colnames(activities_combo) <- "Activity"

# Combine train and test subject files, then name variable "Subject"
subject_combo <- rbind(subject_train.df, subject_test.df)
colnames(subject_combo) <- "Subject"

# Save the columns and names from features which contain mean or std
col_selection <- vector()
col_selection$means <- str_detect(features.df$V2, "-mean")
col_selection$stds <- str_detect(features.df$V2, "-std")
col_selection$select <- col_selection$means | col_selection$stds
saved_cols <- col_selection$select
saved_cols <- which(saved_cols)
# saved_cols
saved_names <- col_selection$select
saved_names <- features.df$V2[which(saved_names)]
# saved_names

# Combine data from train and test sets
data_combo <- rbind(x_train.df, x_test.df)

# Select and name variables containing mean or std
data_combo <- data_combo[ , saved_cols]
colnames(data_combo) <- saved_names

# Combine subject, activities and data
dataset <- cbind(subject_combo, activities_combo, data_combo)

# Variable selection for further analysis (see code book for details)
dataset <- dataset[ , c(1, 2, 3:8, 15:32, 43:48, 52:57, 61:66)]

# Add a Cohort variable
train_cohort <- as.vector(distinct(select(subject_train.df, V1)))
test_cohort <- distinct(select(subject_test.df, V1))
train_set <- which(dataset$Subject %in% train_cohort$V1)
test_set <- which(dataset$Subject %in% test_cohort$V1)
dataset$Cohort <- "Blank"
dataset$Cohort[train_set] <- "Train"
dataset$Cohort[test_set] <- "Test"

# Add a sample Index variable (to maintain samples in order)
dataset$Index <- 1:nrow(dataset)

# Add a variable which combines Subject and Activity
dataset <- mutate(dataset, Subject_Activity = paste(Subject, Activity, sep = "_"))
# subjectActivity <- distinct(select(dataset, Subject_Activity))

# This revealed that subjects performed the same activity more than once
# I have not specified the replicate number
# Group and order the data based on this variable
dataset <- arrange(dataset, Subject_Activity, Index)

# Reorder the variables
dataset <- select(dataset, Subject, Activity, Subject_Activity, Index, Cohort, everything())

# Replace variable codes with plain english descriptors from CodeBook
# note that in order to avoid having to read in the plain_names,
# these have been provided in the code.

# codeBook <- read.delim("CodeBook.txt")
# plain_names <- codeBook$Descriptor
# colnames(dataset) <- plain_names

Code_Book_Descriptors <- c("Subject",
                           "Activity",
                           "Subject_Activity",
                           "Sample_index",
                           "Cohort",
                           "Mean_body_acceleration_in_the_x_axis_time_domain",
                           "Mean_body_acceleration_in_the_y_axis_time_domain",
                           "Mean_body_acceleration_in_the_z_axis_time_domain",
                           "SD_body_acceleration_in_the_x_axis_time_domain",
                           "SD_body_acceleration_in_the_y_axis_time_domain",
                           "SD_body_acceleration_in_the_z_axis_time_domain",
                           "Mean_body_jerk_acceleration_in_the_x_axis_time_domain",
                           "Mean_body_jerk_acceleration_in_the_y_axis_time_domain",
                           "Mean_body_jerk_acceleration_in_the_z_axis_time_domain",
                           "SD_body_jerk_acceleration_in_the_x_axis_time_domain",
                           "SD_body_jerk_acceleration_in_the_y_axis_time_domain",
                           "SD_body_jerk_acceleration_in_the_z_axis_time_domain",
                           "Mean_body_angular_acceleration_in_the_x_axis_time_domain",
                           "Mean_body_angular_acceleration_in_the_y_axis_time_domain",
                           "Mean_body_angular_acceleration_in_the_z_axis_time_domain",
                           "SD_body_angular_acceleration_in_the_x_axis_time_domain",
                           "SD_body_angular_acceleration_in_the_y_axis_time_domain",
                           "SD_body_angular_acceleration_in_the_z_axis_time_domain",
                           "Mean_body_jerk_angular_acceleration_in_the_x_axis_time_domain",
                           "Mean_body_jerk_angular_acceleration_in_the_y_axis_time_domain",
                           "Mean_body_jerk_angular_acceleration_in_the_z_axis_time_domain",
                           "SD_body_jerk_angular_acceleration_in_the_x_axis_time_domain",
                           "SD_body_jerk_angular_acceleration_in_the_y_axis_time_domain",
                           "SD_body_jerk_angular_acceleration_in_the_z_axis_time_domain",
                           "Mean_body_acceleration_in_the_x_axis_frequency_domain",
                           "Mean_body_acceleration_in_the_y_axis_frequency_domain",
                           "Mean_body_acceleration_in_the_z_axis_frequency_domain",
                           "SD_body_acceleration_in_the_x_axis_frequency_domain",
                           "SD_body_acceleration_in_the_y_axis_frequency_domain",
                           "SD_body_acceleration_in_the_z_axis_frequency_domain",
                           "Mean_body_jerk_acceleration_in_the_x_axis_frequency_domain",
                           "Mean_body_jerk_acceleration_in_the_y_axis_frequency_domain",
                           "Mean_body_jerk_acceleration_in_the_z_axis_frequency_domain",
                           "SD_body_jerk_acceleration_in_the_x_axis_frequency_domain",
                           "SD_body_jerk_acceleration_in_the_y_axis_frequency_domain",
                           "SD_body_jerk_acceleration_in_the_z_axis_frequency_domain",
                           "Mean_body_angular_acceleration_in_the_x_axis_frequency_domain",
                           "Mean_body_angular_acceleration_in_the_y_axis_frequency_domain",
                           "Mean_body_angular_acceleration_in_the_z_axis_frequency_domain",
                           "SD_body_angular_acceleration_in_the_x_axis_frequency_domain",
                           "SD_body_angular_acceleration_in_the_y_axis_frequency_domain",
                           "SD_body_angular_acceleration_in_the_z_axis_frequency_domain")
colnames(dataset) <- Code_Book_Descriptors

# Change selected variable to factors
dataset$Subject <- factor(dataset$Subject)
dataset$Subject_Activity <- factor(dataset$Subject_Activity)
dataset$Cohort <- factor(dataset$Cohort)
# str(dataset)

###############################################################################
## SECTION D Analysis

# Transfer to dplyr table format
dataset.dp <- tbl_df(dataset)
dataset.dp <- arrange(dataset.dp, Subject)

# Group by Subject_Activity and calculate means of each variable
sub_act <- group_by(dataset.dp, Subject_Activity)
summary_set <- sub_act %>% select(Mean_body_acceleration_in_the_x_axis_time_domain:
                SD_body_angular_acceleration_in_the_z_axis_frequency_domain) %>% 
                summarise_each(funs(mean))

# Re-extract the subject and activities (to maintain sort order)
subsandacts <- strsplit(as.character(summary_set$Subject_Activity), "_")
subjects <- vector("numeric", 180)
for(i in 1:180) subjects[i] <- subsandacts[[i]][1]
subjects <- as.numeric(subjects)
actions <- vector("character", 180)
for(i in 1:180) actions[i] <- paste(subsandacts[[i]][2], subsandacts[[i]][3], sep = " ")
actions <- gsub(" NA", "", actions)

# Return the Subject and Activity variables; remove Subject_Activity (redundant)
# Create tidy_summary (dimensions 180  44)
tidy_summary <- summary_set %>%
        mutate(Subject = subjects, Activity = actions) %>%
        arrange(Subject, Subject_Activity) %>%
        select(Subject, Activity, everything(), -(Subject_Activity))

# str(tidy_summary)
# head(tidy_summary)
# tail(tidy_summary)
# dim(tidy_summary)

# Write to text file
write.table(tidy_summary, file = "tidy_summary.txt", row.names = FALSE)

