packages<-c("data.table", "dplyr", "reshape2")
sapply(packages, require, character.only = TRUE)



run_analysis <- function(wd ="C:\\Users\\aabodabash\\projects\\wearable_computing_data_cleaning"
                         ,extURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"){
        
        setwd(wd)
        dfList <- readRequiredFiles(wd,extURL)
        
        ## return(dfList)
        
        activitiesDF <-  dfList[[1]] %>% select(V2) %>% setNames("activity")  
        subjectsDF <- dfList[[2]]  %>% setNames("subject")  
        
        
        
        featuersDF <- dfList[[3]] %>%  
                select(num_range("V",grep(x = dfList[[4]]$V2, "mean\\(\\)|std\\(\\)"))) %>%
                setNames(nm = getDescriptiveFeaturesLabels( grep(x = dfList[[4]]$V2, "mean\\(\\)|std\\(\\)",value = T)))
        
        
        
        
        
        tempTidyDF <- data.table( cbind(subjectsDF,activitiesDF,featuersDF) ) ##%>%  write.table(file = "data\\First-TidyData.txt",append = T)
        
        
        secondTidyDF <- aggregate(. ~ subject - activity, data = tempTidyDF, mean) %>%
                arrange(subject,activity) %>%
                write.table("data\\TidyData.txt", row.name=FALSE)
        
        secondTidyDF

}


## download/exract Raw data
getRawData <- function(wd,extURL){
        
        ## change dir to assignment project dir
      
        tempFile <- paste(tempdir(),"temp.zip",sep = "\\")
        download.file(extURL,destfile = tempFile )
        
        if( !dir.exists("data-raw")){
                dir.create("data-raw")
        }
        
        listOfFiles <- unzip(tempFile , exdir = "data-raw")
        unlink(tempFile)
}


##Rename Featuers shortcuts to decriptive names
getDescriptiveFeaturesLabels <- function(vectorData){
        ## featuers Labels
        
        
        vectorData <- gsub("^t" ,"time-",vectorData) 
        vectorData <- gsub("^f" ,"frequency-",vectorData) 
        vectorData <- gsub("Acc" ,"-Accelerometer",vectorData) 
        vectorData <- gsub("Gyro" ,"-Gyroscope",vectorData) 
        vectorData <- gsub("Mag" ,"-Magnitude",vectorData) 
        vectorData <- gsub("BodyBody" ,"Body",vectorData) 
        
        vectorData
        
}

## read Only required files "as per assignment scope"
readRequiredFiles <- function(wd,extURL){
        
        
        dataRawDir <- "data-raw\\UCI HAR Dataset"
        
        ## check if the raw data exsit , if not download&extract it to data-raw dir
        if( ! dir.exists(dataRawDir)){
                getRawData(wd,extURL)  
        }
        
        ######  Loading data raw into vars   ######  
        
        
        ## activityies Labels in order to be joined with actiuvities data
        activitesLookUp <- read.table(file.path(dataRawDir,"activity_labels.txt"),header = F)
        
        ## Activities data
        activitiesData <-   rbind(
                read.table(file.path(dataRawDir,"train","y_train.txt"),header = F)
                ,read.table(file.path(dataRawDir,"test","y_test.txt"),header = F) ) %>%
                left_join(activitesLookUp, by = "V1")
        
        ##names(activitiesDF) <- c("activityID","activity")
        
        
        
        ## Subjects data
        subjectsData <- rbind(
                read.table(file.path(dataRawDir,"train","subject_train.txt"),header = F)
                ,read.table(file.path(dataRawDir,"test","subject_test.txt"),header = F)
        )
        
        ##names(subjectsDF) <- "subjectID"
        
        
        
        ## Featuers data
        featuersData <- rbind(
                read.table(file.path(dataRawDir,"train","x_train.txt"),header = F)
                ,read.table(file.path(dataRawDir,"test","x_test.txt"),header = F)
        )
        
        
        
        
        ## return a list of four plyr Dataframes
        list(tbl_df(activitiesData),
             tbl_df(subjectsData),
             tbl_df(featuersData),
             tbl_df( read.table(file.path(dataRawDir,"features.txt"),header = F)))
}


