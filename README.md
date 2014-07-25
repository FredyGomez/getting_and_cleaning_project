# Getting and Cleaning Data Course Project

The current repository contains the necessary script and documentation for the "Getting and Cleaning Data" course prohect.

There are three different files in the repository:

- README.md: current file to give an explanation of the content of the repository and an overview of the project and its functioning

- run_analysis.R: script to perform the requested operations

- CodeBook.md: Document with the data dictionary and transforming operations description of the project


## run_analysis.R script

### High level description

The run_analysis.R perform several data capture, transformation and merging operations on the data.

The first thing that the script does is getting the data for the different data sets, selecting inly the appropriate columns.

It also performs a rename of the columns to make it more readable.

Finally it performs the merging and exporting of the data.


### Instructions:

The script and data should be located in the same directory than the file, 


Once the data is downloaded from the location:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and unzipped, it should result in a "UCI HAR Dataset" folder that has all the files in the required structure.

The working directory should be changed to this folder, and allocate there the script.

Once the script has finished, the tidy,txt file will be located in the same folder.

Code book for the tidy dataset is available here:

https://github.com/FredyGomez/getting_and_cleaning_project/blob/master/CodeBook.md


