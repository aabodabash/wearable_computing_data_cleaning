---
output: 
  html_document: 
    keep_md: yes
---
UCI HAR Datasets cleaning & processing 
==================================
This is a [assignment](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project) project,and aims to demostrate how to get and clean  the data to be ready for further analysis, giving raw datasets about human activities recorded by smartphone "accelerometer & gyroscope" sensors, this code will clean and process these sets onto one tiday dataset , for more information about this [experimiets and the source Dataset description-link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).


There are three folders inside this project:

- R 
...for R code and contains only one file "run_analysis.R"
- data-raw
...contian extracted data raw donwloaded from UCI site.
- data
... for output tidy data.


we encasulate getting the raw data and clean it in four different functions: *run_analysis()*, *readRequiredFiles()* ,*getRawData()*, and *getDescriptiveFeaturesLabels()* code splitted into smaller functions in order to be readable and tracable code located in  ( <R>/run_analysis.R ).

There're two packages required to run the code, it will automatically loaded by  sourcing the run_analysis.R file

```sh
packages<-c("data.table", "dplyr")
sapply(packages, require, character.only = TRUE)
```

Ill go through the analysis process regardless the which function the code is, the code commented well so you can review and follow the code.  
now lets digge into analysis process:

by calling *run_analysis()* function and it will do the following:

- download raw data if not donwloaded before, and extract it to <./data-raw> dir
- read only required datasets and merg it into different sets (we will descipe this in more details later)
- tidying datasets.
- export pretidying data "mergedData.txt" & tidy dataset "tidyData.txt" to <./data> dir



```sh

tidyDataDF <- run_analysis() 
## there's optional parameter refering to raw-data donwload url

```

lets digg into  run_analysis() function code, first line calling another function *readRequiredFiles()* this function handle reading required files for this course analysis scope,So it will try to read raw data from <data-raw> dir, if dose not exsit it will download it via download function *getRawData()*   , the code commented well, so no need to copy the code for these two functions here, kindly open the run_analysis.R file and follow the code with the comments.





```sh
run_analysis <- function(extURL = "..."){
        
        dfList <- readRequiredFiles(extURL)
        .
        ..
        ....
        ......

}

```


***By Ameen AboDabash  29-Feb 2016***



   [aabodabash]: <https://github.com/aabodabash>
   [git-repo-url]: <https://github.com/aabodabash/wearable_computing_data_cleaning.git>
   [Ameen AboDabash]: <https://ae.linkedin.com/in/prophysicist>
 
