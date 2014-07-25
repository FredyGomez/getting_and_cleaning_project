# Getting and Cleaning Data Course Project

The current repository contains the necessary script and documentation for the "Getting and Cleaning Data" course prohect.

There are three different files in the repository:

- README.md: current file to give an explanation of the content of the repository and an overview of the project and its functioning

- run_analysis.R: script to perform the requested operations

- CodeBook.md: Document with the data dictionary and transforming operations description of the project


## run_analysis.R script

### High level description

The run_analysis.R perform several data capture, transformation and me


### Instructions:

The script and data should be located in the same directory than the file, 


Clone this repository
Download the data set and extract. It should result in a UCI HAR Dataset folder that has all the files in the required structure.
Change current directory to the UCI HAR Dataset folder.
Run Rscript <path to>/run_analysis.R
The tidy dataset should get created in the current directory as tidy.txt
Code book for the tidy dataset is available here
Assumptions

The training and test data are available in folders named train and test respectively.
For each of these data sets:
Measurements are present in X_<dataset>.txt file
Subject information is present in subject_<dataset>.txt file
Activity codes are present in y_<dataset>.txt file
All activity codes and their labels are in a file named activity_labels.txt.
Names of all measurements taken are present in file features.txt ordered and indexed as they appear in the X_<dataset>.txt files.
All columns representing means contain ...mean() in them.
All columns representing standard deviations contain ...std() in them.