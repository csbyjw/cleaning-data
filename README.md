## Getting and Cleaning Data Project

1 - Download the dataset at:
 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2 - Extract the zipfile into a folder on your local drive ( e.g C:\R\ )

* Put run_analysis.R to  

3 - In R-Studio set the working diretory with the command: 

```{r}
setwd("C:/R/CleanData")
```
4 - Execute the script by running (the execution might take long time to complete):

```{r}
source('C:/R/CleanData/run_analysis.R')
```

5 - The script should should create a new file with the tidy dataset into the folder.