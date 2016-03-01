
Codebook - UCI HAR Tidy Dataset 
==================================
*by Ameen AboDabash  29-Feb 2016* 
as part of Data Cleaning course [assignment](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project), for more information about raw data and information about experiments carried on to load the raw data [available here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)



###Dataset Description
Summarize activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) carried by 30 volunteers, by calculating the average of mean and SD Smartphone Accelerometer & Gyroscope measurements, 180 observation in total (6 activities * 30 subjects), each record represent different variable, one observation per raw showing the average measurements for a specific volunteer"subject" and a specific activity.



###Dataset Variables

 **subject** 
	-Variable  type: Numeric
	
	-Allowable Values: 1: 30 ( 30 volunteers)
	
 **activity** 
	-Variable  type: factor
	
	-Allowable Values:   (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
	
**features Vars**
        -Variables  type: Numeric  
        
	-feather name is descriptive enough to tell you the meaning of each measure, however, there are couple of abbreviations need to be clear:
		-Jerk = sudden movement acceleration
		-mean and SD is calculated for each subject for each activity.
		-avg calculated for each subject per activity mean & SD measures 

  	
features | features(cont)    
| ------------- |-------------|  
avg.time-Body-Accelerometer-mean()-X|avg.time-Body-Accelerometer-Magnitude-mean()
avg.time-Body-Accelerometer-mean()-Y|avg.time-Body-Accelerometer-Magnitude-std()
avg.time-Body-Accelerometer-mean()-Z|avg.time-Gravity-Accelerometer-Magnitude-mean()
avg.time-Body-Accelerometer-std()-X|avg.time-Gravity-Accelerometer-Magnitude-std()
avg.time-Body-Accelerometer-std()-Y|avg.time-Body-AccelerometerJerk-Magnitude-mean()
avg.time-Body-Accelerometer-std()-Z|avg.time-Body-AccelerometerJerk-Magnitude-std()
avg.time-Gravity-Accelerometer-mean()-X|avg.time-Body-Gyroscope-Magnitude-mean()
avg.time-Gravity-Accelerometer-mean()-Y|avg.time-Body-Gyroscope-Magnitude-std()
avg.time-Gravity-Accelerometer-mean()-Z|avg.time-Body-GyroscopeJerk-Magnitude-mean()
avg.time-Gravity-Accelerometer-std()-X|avg.time-Body-GyroscopeJerk-Magnitude-std()
avg.time-Gravity-Accelerometer-std()-Y|avg.frequency-Body-Accelerometer-mean()-X
avg.time-Gravity-Accelerometer-std()-Z|avg.frequency-Body-Accelerometer-mean()-Y
avg.time-Body-AccelerometerJerk-mean()-X|avg.frequency-Body-Accelerometer-mean()-Z
avg.time-Body-AccelerometerJerk-mean()-Y|avg.frequency-Body-Accelerometer-std()-X
avg.time-Body-AccelerometerJerk-mean()-Z|avg.frequency-Body-Accelerometer-std()-Y
avg.time-Body-AccelerometerJerk-std()-X|avg.frequency-Body-Accelerometer-std()-Z
avg.time-Body-AccelerometerJerk-std()-Y|avg.frequency-Body-AccelerometerJerk-mean()-X
avg.time-Body-AccelerometerJerk-std()-Z|avg.frequency-Body-AccelerometerJerk-mean()-Y
avg.time-Body-Gyroscope-mean()-X|avg.frequency-Body-AccelerometerJerk-mean()-Z
avg.time-Body-Gyroscope-mean()-Y|avg.frequency-Body-AccelerometerJerk-std()-X
avg.time-Body-Gyroscope-mean()-Z|avg.frequency-Body-AccelerometerJerk-std()-Y
avg.time-Body-Gyroscope-std()-X|avg.frequency-Body-AccelerometerJerk-std()-Z
avg.time-Body-Gyroscope-std()-Y|avg.frequency-Body-Gyroscope-mean()-X
avg.time-Body-Gyroscope-std()-Z|avg.frequency-Body-Gyroscope-mean()-Y
avg.time-Body-GyroscopeJerk-mean()-X|avg.frequency-Body-Gyroscope-mean()-Z
avg.time-Body-GyroscopeJerk-mean()-Y|avg.frequency-Body-Gyroscope-std()-X
avg.time-Body-GyroscopeJerk-mean()-Z|avg.frequency-Body-Gyroscope-std()-Y
avg.time-Body-GyroscopeJerk-std()-X|avg.frequency-Body-Gyroscope-std()-Z
avg.time-Body-GyroscopeJerk-std()-Y|avg.frequency-Body-Accelerometer-Magnitude-mean()
avg.time-Body-GyroscopeJerk-std()-Z|avg.frequency-Body-Accelerometer-Magnitude-std()
avg.frequency-Body-Gyroscope-Magnitude-std()|avg.frequency-Body-AccelerometerJerk-Magnitude-mean()
avg.frequency-Body-GyroscopeJerk-Magnitude-mean()|avg.frequency-Body-AccelerometerJerk-Magnitude-std()
avg.frequency-Body-GyroscopeJerk-Magnitude-std()|avg.frequency-Body-Gyroscope-Magnitude-mean()



###Dataset Files

Cleaned dataset:
```sh
.\data\TidyData.txt
```

you can find raw datasets used to produce the above processed dataset in the follwing directory:
```sh
.\data-raw\...
```
    



   [aabodabash]: <https://github.com/aabodabash>
   [git-repo-url]: <https://github.com/aabodabash/wearable_computing_data_cleaning.git>
   [Ameen AboDabash]: <https://ae.linkedin.com/in/prophysicist>
 
