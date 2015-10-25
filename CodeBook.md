Analysis of Human Activity Recognition Using Smartphones Data Set
====================================================================

## Experimental Design

Briefly, volunteer subjects (1-30) wearing a Samsung phone on a belt were randomly assigned
to two cohorts (70% train, 30% test) and observed while participating on at least one occasion 
in six activities (walking etc). Accelerometer and gyroscope data from the phone were sampled (50Hz) 
in timed windows (2.56s) providing 128 observations with 50% overlap between adjacent windows. 
These data were processed to provide 561 summary features which are the basis of this secondary analysis. 
The data from the two cohorts were combined and only those features presenting the means or 
standard deviations were selected.

### A full description of the data may be obtained from:

[Link to description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### The raw data may be obtained from:

[Link to data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### The appropriate citation for these data is:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.
A Public Domain Dataset for Human Activity Recognition Using Smartphones.
21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013.
Bruges, Belgium 24-26 April 2013.

### The description of the code used for getting, cleaning and analysing the data is provided in the README.md

=============================================================================================

## Code book

ID	Code	Descriptor		Comment

1	Subject
		Subject
					Subjects 1-30 (2, 4, 9, 10, 12, 13, 18, 20, 24 were in the test cohort )
2	Activity
		Activity
					WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
3	Subject_Activity
		Subject_Activity
					Combination of Subject and Activity variables (may be replicates)             
4	Cohort
		Cohort
					Train or Test group of subjects
5	Index
		Sample_index
					Identifier for sample of data (in order within replicates)
6	tBodyAcc-mean()-X
		Mean_body_acceleration_in_the_x-axis_time_domain
					Accelerometer data normalized and bounded within [-1,1]
7	tBodyAcc-mean()-Y
		Mean_body_acceleration_in_the_y-axis_time_domain
					Accelerometer data normalized and bounded within [-1,1]
8	tBodyAcc-mean()-Z
		Mean_body_acceleration_in_the_z-axis_time_domain
					Accelerometer data normalized and bounded within [-1,1]
9	tBodyAcc-std()-X
		SD_body_acceleration_in_the_x-axis_time_domain
					Accelerometer data normalized and bounded within [-1,1]
10	tBodyAcc-std()-Y
			SD_body_acceleration_in_the_y-axis_time_domain
					Accelerometer data normalized and bounded within [-1,1]
11	tBodyAcc-std()-Z
			SD_body_acceleration_in_the_z-axis_time_domain
					Accelerometer data normalized and bounded within [-1,1]
12	tBodyAccJerk-mean()-X
			Mean_body_jerk_acceleration_in_the_x-axis_time_domain
					Accelerometer data normalized and bounded within [-1,1]
13	tBodyAccJerk-mean()-Y
			Mean_body_jerk_acceleration_in_the_y-axis_time_domain
					Accelerometer data normalized and bounded within [-1,1]
14	tBodyAccJerk-mean()-Z
			Mean_body_jerk_acceleration_in_the_z-axis_time_domain
					Accelerometer data normalized and bounded within [-1,1]
15	tBodyAccJerk-std()-X
			SD_body_jerk_acceleration_in_the_x-axis_time_domain
					Accelerometer data normalized and bounded within [-1,1]
16	tBodyAccJerk-std()-Y
			SD_body_jerk_acceleration_in_the_y-axis_time_domain
					Accelerometer data normalized and bounded within [-1,1]
17	tBodyAccJerk-std()-Z
			SD_body_jerk_acceleration_in_the_z-axis_time_domain
					Accelerometer data normalized and bounded within [-1,1]
18	tBodyGyro-mean()-X
			Mean_body_angular_acceleration_in_the_x-axis_time_domain
					Gyroscope data normalized and bounded within [-1,1]
19	tBodyGyro-mean()-Y
			Mean_body_angular_acceleration_in_the_y-axis_time_domain
					Gyroscope data normalized and bounded within [-1,1]
20	tBodyGyro-mean()-Z
			Mean_body_angular_acceleration_in_the_z-axis_time_domain
					Gyroscope data normalized and bounded within [-1,1]
21	tBodyGyro-std()-X
			SD_body_angular_acceleration_in_the_x-axis_time_domain
					Gyroscope data normalized and bounded within [-1,1]
22	tBodyGyro-std()-Y
			SD_body_angular_acceleration_in_the_y-axis_time_domain
					Gyroscope data normalized and bounded within [-1,1]
23	tBodyGyro-std()-Z
			SD_body_angular_acceleration_in_the_z-axis_time_domain
					Gyroscope data normalized and bounded within [-1,1]
24	tBodyGyroJerk-mean()-X
			Mean_body_jerk_angular_acceleration_in_the_x-axis_time_domain
					Gyroscope data normalized and bounded within [-1,1]
25	tBodyGyroJerk-mean()-Y
			Mean_body_jerk_angular_acceleration_in_the_y-axis_time_domain
					Gyroscope data normalized and bounded within [-1,1]
26	tBodyGyroJerk-mean()-Z
			Mean_body_jerk_angular_acceleration_in_the_z-axis_time_domain
					Gyroscope data normalized and bounded within [-1,1]
27	tBodyGyroJerk-std()-X
			SD_body_jerk_angular_acceleration_in_the_x-axis_time_domain
					Gyroscope data normalized and bounded within [-1,1]
28	tBodyGyroJerk-std()-Y
			SD_body_jerk_angular_acceleration_in_the_y-axis_time_domain
					Gyroscope data normalized and bounded within [-1,1]
29	tBodyGyroJerk-std()-Z
			SD_body_jerk_angular_acceleration_in_the_z-axis_time_domain
					Gyroscope data normalized and bounded within [-1,1]
30	fBodyAcc-mean()-X
			Mean_body_acceleration_in_the_x-axis_frequency_domain
					Accelerometer data normalized and bounded within [-1,1]
31	fBodyAcc-mean()-Y
			Mean_body_acceleration_in_the_y-axis_frequency_domain
					Accelerometer data normalized and bounded within [-1,1]
32	fBodyAcc-mean()-Z
			Mean_body_acceleration_in_the_z-axis_frequency_domain
					Accelerometer data normalized and bounded within [-1,1]
33	fBodyAcc-std()-X
			SD_body_acceleration_in_the_x-axis_frequency_domain
					Accelerometer data normalized and bounded within [-1,1]
34	fBodyAcc-std()-Y
			SD_body_acceleration_in_the_y-axis_frequency_domain
					Accelerometer data normalized and bounded within [-1,1]
35	fBodyAcc-std()-Z
			SD_body_acceleration_in_the_z-axis_frequency_domain
					Accelerometer data normalized and bounded within [-1,1]
36	fBodyAccJerk-mean()-X
			Mean_body_jerk_acceleration_in_the_x-axis_frequency_domain
					Accelerometer data normalized and bounded within [-1,1]
37	fBodyAccJerk-mean()-Y
			Mean_body_jerk_acceleration_in_the_y-axis_frequency_domain
					Accelerometer data normalized and bounded within [-1,1]
38	fBodyAccJerk-mean()-Z
			Mean_body_jerk_acceleration_in_the_z-axis_frequency_domain
					Accelerometer data normalized and bounded within [-1,1]
39	fBodyAccJerk-std()-X
			SD_body_jerk_acceleration_in_the_x-axis_frequency_domain
					Accelerometer data normalized and bounded within [-1,1]
40	fBodyAccJerk-std()-Y
			SD_body_jerk_acceleration_in_the_y-axis_frequency_domain
					Accelerometer data normalized and bounded within [-1,1]
41	fBodyAccJerk-std()-Z
			SD_body_jerk_acceleration_in_the_z-axis_frequency_domain
					Accelerometer data normalized and bounded within [-1,1]
42	fBodyGyro-mean()-X
			Mean_body_angular_acceleration_in_the_x-axis_frequency_domain
					Gyroscope data normalized and bounded within [-1,1]
43	fBodyGyro-mean()-Y
			Mean_body_angular_acceleration_in_the_y-axis_frequency_domain
					Gyroscope data normalized and bounded within [-1,1]
44	fBodyGyro-mean()-Z
			Mean_body_angular_acceleration_in_the_z-axis_frequency_domain
					Gyroscope data normalized and bounded within [-1,1]
45	fBodyGyro-std()-X
			SD_body_angular_acceleration_in_the_x-axis_frequency_domain
					Gyroscope data normalized and bounded within [-1,1]
46	fBodyGyro-std()-Y
			SD_body_angular_acceleration_in_the_y-axis_frequency_domain
					Gyroscope data normalized and bounded within [-1,1]
47	fBodyGyro-std()-Z
			SD_body_angular_acceleration_in_the_z-axis_frequency_domain
					Gyroscope data normalized and bounded within [-1,1]
