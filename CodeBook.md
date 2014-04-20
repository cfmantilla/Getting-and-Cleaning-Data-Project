a complete list of all your data, showing the name of each variable, the values the variable takes, and a complete description of how that variable is operationalized. 



From the features_info.txt file we know the Mean value columns have "mean" 
in their name and Standard deviation columns have "std"; the indices for
the columns we want are: 

Activity and subject codes
Importing test data, we only need a subset of columns

x_test is a big table and it is no longer needed

adds column names on features.txt to the data frame

append the activity and subject codes to test data frame
this does the same for the training data:

test.train has all observations

assigning activity labels from the activity codes:

write.table(result,"Averages_by_Activity_and_Subject.txt", col.names=TRUE, row.names=FALSE)



