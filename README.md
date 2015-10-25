# SamsungAnalysis

# Analysis of Human Activity Recognition Using Smartphones Data Set
===================================================================

Briefly, volunteer subjects (1-30) wearing a Samsung phone on a belt were randomly assigned
to two cohorts (70% train, 30% test) and observed while participating on at least one occasion 
in six activities (walking etc). Accelerometer and gyroscope data from the phone were sampled (50Hz) 
in timed windows (2.56s) providing 128 observations with 50% overlap between adjacent windows. 
These data were processed to provide 561 summary features which are the basis of this secondary analysis. 
The data from the two cohorts were combined and only those features presenting the means or 
standard deviations were selected.

## A full description of the data may be obtained from:

[Link to description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## The raw data may be obtained from:

[Link to data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## The appropriate citation for these data is:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.
A Public Domain Dataset for Human Activity Recognition Using Smartphones.
21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013.
Bruges, Belgium 24-26 April 2013.

## This repository contains the following items:

* CodeBook.md which describes the variables, the data, and the transformations performed
* run_analysis.R which is the script file which contains the code to extract and tidy the data for analysis

The steps in the run_analysis.R script file are described in detail below:

# PREPARATION
## Loading the necessary packages which include:
* readr
* stringr
* dplyr

# SECTION A for use if the data have to be downloaded (by default it is commented out)
## Data acquisition 

* a working directory was created called "Samsung", provided it was not already present
* the zip file was downloaded from the source above
* the files were un-zipped AND LEFT IN THEIR RELATIVE LOCATIONS WITH RESPECT TO THE WD
* the zip file was removed
* the date of the download was recorded in dateDownloaded
* the files which described the activities and the features (analyses) were read into R 
* the files for the subjects and activities from the train and test cohorts were read into R
* the fixed width format files containing the accelerometer and gyroscopic data were read into R

# SECTION B for use when the following files are already in the working directory (as required for marking)
## Required files
* activity_labels.txt
* features.txt
* subject_train.txt
* y_train.txt
* subject_test.txt
* y_test.txt
* X_train.txt
* X_test.txt

## Data acquisition
* the files which described the activities and the features (analyses) were read into R 
* the files for the subjects and activities from the train and test cohorts were read into R
* the fixed width format files containing the accelerometer and gyroscopic data were read into R

# SECTION C common to both methods A and B
## cleaning and combining files to create a tidy dataset

* the numerical activity codes were substituted with their descriptors
* the train and test activity files were combined in rows (in that order) and the variable named "Activity"
* the train and test subject files were combined in rows (in that order) and the variable named "Subject" 
* the variables containing the mean or standard deviations from the features file were identified
* the train and test activity files were combined in rows (in that order)
* the variables were selected which were previously identified as pertaining to the means and stds
* the variables were named from the corresponding entries in the features file
* the "Subject", "Activity" and data files were combined in columns (in that order)
* the variables were further selected to include only those related to:
		triaxial body acceleration and
		triaxial angular velocity, in both the time and frequency domains
* the Index variable was added
* the cohort variable was added
* the variable colums were re-ordered
* descriptors from the CodeBook were used to replace the variable codes (For ease of marking, these are coded)

The output is a data.frame: 102999 obs. of 47 variables called dataset.

Each row in dataset represents a unique sample taken from a subject 
belonging to the training or testing cohort during the specified activity.
Each column contains a single variable.

# SECTION D Analysis
## Stages in the analysis and return of the text table tidy_summary.txt:

* the data frame was converted to dplyr tbl format   
* the data were grouped by Subject_Activity (the composite variable created to make analysis easier
* the means of each variable were calculated
* the subjects were re-extracted and returned to the table (to maintain sort order)
* the tidy_summary (dimensions 180 obs  44 variables) was created, removing Subject variable (as not required)
* the tidy_summary was written to a text file





