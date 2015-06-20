##Analysis overview
Provided R code allows researcher to download, read and clean Samsung data about users activities. Cleaned up and summarised data are exported in txt file in R working directory
Analysis is based on the data imported from web repository and stored in R working directory.
You can preview initial data by the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description if the project and the way how the data was collected can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Provided analysis do the followings:
1. Imports and merges train and test data sets available by the link above.
2. Provides descriptive names for variables
3. Creates new data set that includes mean and standard deviation for each measurement
4. Computes average value for variables defined in step 3

To run the analysis on your PC perform download run_analysis.R file and execute it in R.
The following conditions should be kept to perform analysis successfully:
1. Your PC should be connected to the Internet
2. User should have read?write permissions to R working directory
3. Any file names or variables should not be renamed

Result data set includes mean values per user per activity computed based on initial data.
Final data set includes the following variables:
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean