Getting-and-Cleaning-Data-Project
=================================

This repository contains the script required to solve the peer assignment 
activity for the course Getting and Cleaning Data by Jeff Leek on Coursera
https://class.coursera.org/getdata-002/

The name of the script is 'run_analysis.R' it can be downloaded from GitHub on
'https://github.com/cfmantilla/Getting-and-Cleaning-Data-Project/blob/master/run_analysis.R'

This repository also contains the code book for the script 'CodeBook.md' that 
explains the inputs and results of the script on: 
https://github.com/cfmantilla/Getting-and-Cleaning-Data-Project/blob/master/CodeBook.md

## How the script works
The script uses the *features.txt* file to determine the columns to be selected 
from the *X _ test* and *X _ train* data, the vector of indices of these columns is 
assigned to *Measurement.Columns*

Data frame *test* has the subset of columns of *X _ test* using only the columns 
indexed by *Measurement.Columns*, the data frame *train* also has the subset of 
columns of X _ train using only the columns indexed by *Measurement.Columns*

Both dataframes *train* and *test* use the column names on *features.txt* 

Now two new columns are added to data frames *train* and *test*: 
The Activity.Code comes from files *test/y_test.txt* and *train/y_train.txt* 
and the subject codes come from files *test/subject_test.txt* and
*train/subject_train.txt* for test and train records.

After adding the required columns the script appends both data frames by 
row using the rbind function.

The required result still needs the Activity label, this is obtained by merging
the *test.train* data frame with Activity.Labels using the Activity.Code as the 
joining column (by default as it has the same name on both data frames).
This result is stored in the new HAR data frame.

The 5th task is completed by aggregating HAR, reporting the mean of the 
observations broken up by Subject code and Activity.Label.
