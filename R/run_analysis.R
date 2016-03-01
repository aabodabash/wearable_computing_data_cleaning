packages<-c("data.table", "dplyr")
sapply(packages, require, character.only = TRUE)

## change the following to your working directory
## or comment it out, and the code will create data-raw and data directories in current wd
## setwd("C:\\Users\\aabodabash\\projects\\wearable_computing_data_cleaning")


## Main function
## analysis donloaded Files
## overall description in readme file
run_analysis <- function(extURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"){
        
        ##Call onther function to download the data extURL
        ##this function donwload files if not donwloaded
        ##extract this files into data-raw folder 
        ##return a list dataframes of required data
        ##### [[1]] ---> activitis [[2]] ---> sunjects ...
        ##<%more detials inside the function readRequiredFiles itself%>
        dfList <- readRequiredFiles(extURL)
        
        
        ## tidying  activities data
        activitiesDF <-  dfList[[1]] %>%  
                                select(V2) %>% ## select only Activity Name column- no need for IDs
                                        setNames("activity")  ## set new DF col name
        
        
        ## tidying  subjects data
        subjectsDF <- dfList[[2]]  %>% 
                                setNames("subject")  ## set new DF col name
        
        
        ## tidying  featuers data
        featuersDF <- dfList[[3]] %>%  
                ## Select only measurments with mean and sd using grep
                ## resulting arround 66 cols from 500+ cols
                select(num_range("V",grep(x = dfList[[4]]$V2, "mean\\(\\)|std\\(\\)"))) %>%
                ## set new DF col names using the same techniqe
                setNames(nm = getDescriptiveFeaturesLabels( grep(x = dfList[[4]]$V2, "mean\\(\\)|std\\(\\)",value = T)))
        
        
        ## creating a datatable (easy to maiting package data.table)
        ## combine all tidied DF (subjects, activities & featuers) using cbind
        tempTidyDF <- data.table( cbind(subjectsDF,activitiesDF,featuersDF) )    
        
        
        ## cooking the second tidying dataset
        ## aggregate by ( subject & activity ), and apply mean for remaining cols (.) 
        secondTidyDF <- aggregate(. ~ subject - activity, data = tempTidyDF, mean) %>%
                ## reorder data
                arrange(subject,activity) %>%
                ## add the perfix "avg." to all measurments vairables
                setNames( nm=   c("subject","activity",paste("avg.", getDescriptiveFeaturesLabels(grep(x = dfList[[4]]$V2, "mean\\(\\)|std\\(\\)",value = T )) ,sep = "") )  )  
               

        ## write both files to output directory
        write.table(tempTidyDF,file = "data\\MergedData.txt", row.name=FALSE ) ## not required
        write.table(secondTidyDF,"data\\TidyData.txt", row.name=FALSE) ## required as per assignment
        
        
        secondTidyDF

}


## Just download/exract Raw data if not exists
getRawData <- function(extURL){
        
        ## tem directory to store downloaded zip file
        ## and to be deleted after extract
        tempFile <- paste(tempdir(),"temp.zip",sep = "\\")
        
        download.file(extURL,destfile = tempFile )
        
        if( !dir.exists("data-raw")){
                dir.create("data-raw")
        }
        
        listOfFiles <- unzip(tempFile , exdir = "data-raw")
        unlink(tempFile)
}




## Read Only required files "as per assignment scope"
## and return resutls as list of Dataframes
## 1- Activities 2- Subjects 3- featers 4- featuer Lables 
readRequiredFiles <- function(extURL){
        
        
        dataRawDir <- "data-raw\\UCI HAR Dataset"
        
        ## check if the raw data exsit
        ## if not download&extract it to data-raw dir
        if( ! dir.exists(dataRawDir)){
                getRawData(extURL)  
        }
        
       
     
        
        ## Activities data
        activitiesData <-   rbind( ## combine training & test rows then  join with activities lables
                read.table(file.path(dataRawDir,"train","y_train.txt"),header = F)
                ,read.table(file.path(dataRawDir,"test","y_test.txt"),header = F) ) %>%
                ## left join activities lables to be used as descritive value later
                left_join(read.table(file.path(dataRawDir,"activity_labels.txt"),header = F), by = "V1")
        
     
        
        
        
        ## Subjects data
        subjectsData <- rbind(## combine training & test rows 
                read.table(file.path(dataRawDir,"train","subject_train.txt"),header = F)
                ,read.table(file.path(dataRawDir,"test","subject_test.txt"),header = F)
        )
        
     
        
        
        
        ## Featuers data
        featuersData <- rbind(## combine training & test rows 
                read.table(file.path(dataRawDir,"train","x_train.txt"),header = F)
                ,read.table(file.path(dataRawDir,"test","x_test.txt"),header = F)
        )
        
        
        
        
        ## return a list of four plyr Dataframes
        list(  
                activitiesData, ## activities [V1,V2]
                subjectsData, ## subjects [V1]
                featuersData, ## featuers data [V1:v5xx]
                read.table(file.path(dataRawDir,"features.txt"),header = F) ## featuers Lables
             )
}



## Rename Features labels to be more human readable and descriptive
## called internally by ran_analysis
getDescriptiveFeaturesLabels <- function(vectorData){
        vectorData <- gsub("^t" ,"time-",vectorData) 
        vectorData <- gsub("^f" ,"frequency-",vectorData) 
        vectorData <- gsub("Acc" ,"-Accelerometer",vectorData) 
        vectorData <- gsub("Gyro" ,"-Gyroscope",vectorData) 
        vectorData <- gsub("Mag" ,"-Magnitude",vectorData) 
        vectorData <- gsub("BodyBody" ,"Body",vectorData) 
        vectorData
}


############################################
############################################
## by: Ameen AboDabash
## 29 Feb 2016
## https://ae.linkedin.com/in/prophysicist
############################################
############################################
