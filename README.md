**Script Design**
===========
The Github repo contains only one R script (run_analysis.R).
**Assumptions:**
----
 - The script assumes that the data is downloaded manually and unzipped. The script should be placed in the folder as the data itself.
 - Variable names in the submitted tidy dataset follows the Camel naming scheme.  This is due to long variable names.
 - The script should be placed in the folder that contains the train, test and the rest of data files.
 - setwd() should used to set the working directory to be the same folder that contains the data and the run_analysis.R.

**Script Flow:**
----
 1. Read activity_labels.csv, features.txt, X_train.txt, X_test.txt, y_train.txt, y_test.txt, subject_train.txt and subject_test.txt
 2. Give names for the features in the datasets which are created from the X_train.txt and X_test.txt. The names are obtained from features.txt.
 3. Replace the activity id by the actual activity name for the training and the testing data.
 4. Append the SubjectId column to the training dataset and the same for the testing dataset.
 5. Append the ActivityLevel column to the training dataset and the same for the testing dataset.
 6. Append a DataType column which differentiate train dataset from testing dataset.
 7. Merge the training dataset and the testing dataset called "all.data".
 8. Create subset dataset from the dataset ,which is created in the previous step, that contains SubjectId,ActivityLevel and any column contains mean or standard deviation measure. I assumed that any column cotains "-mean" will hold mean measure. If it contains "-std" will hold standard deviation measure.
 9. Create "Avg.Data" dataset which contains the mean for each variable extracted in the previous step per SubjectId per ActivityLevel. This dataset contains 180 rows (30 subjects * 6 Activity Levels). Some values will be NaN as the some subjects have no measures for a particular activity levels in the original dataset.

**Tidy Dataset Variables:**
---
All the variables except the first two are calculated as the Mean for its counterpart in the original dataset per subject per activity level
 1. SubjectId: Subject Id. The values are from integers from 1 to 30.
 2. ActivityLevel: Name of the activity which the measures calculated for. The values are the same as the names exist in the activity_labels.txt in the original dataset.
 3. MeanTimeDomainBodyAccelerometerMeanX: Mean for the "tBodyAcc-mean()-X" variable, which is in the original dataset.
 4. MeanTimeDomainBodyAccelerometerMeanY: Mean for the "tBodyAcc-mean()-Y" variable, which is in the original dataset.
 5. MeanTimeDomainBodyAccelerometerMeanZ: Mean for the "tBodyAcc-mean()-Z" variable, which is in the original dataset.
 6. MeanTimeDomainBodyAccelerometerStandardDeviationX: Mean for the "tBodyAcc-std()-X" variable, which is in the original dataset.
 7. MeanTimeDomainBodyAccelerometerStandardDeviationY: Mean for the "tBodyAcc-std()-Y" variable, which is in the original dataset.
 8. MeanTimeDomainBodyAccelerometerStandardDeviationZ: Mean for the "tBodyAcc-std()-Z" variable, which is in the original dataset.
 9. MeanTimeDomainGravityAccelerometerMeanX: Mean for the "tGravityAcc-mean()-X" variable, which is in the original dataset.
 10. MeanTimeDomainGravityAccelerometerMeanY: Mean for the "tGravityAcc-mean()-Y" variable, which is in the original dataset.
 11. MeanTimeDomainGravityAccelerometerMeanZ: Mean for the "tGravityAcc-mean()-Z" variable, which is in the original dataset.
 12. MeanTimeDomainGravityAccelerometerStandardDeviationX: Mean for the "tGravityAcc-std()-X" variable, which is in the original dataset.
 13. MeanTimeDomainGravityAccelerometerStandardDeviationY: Mean for the "tGravityAcc-std()-Y" variable, which is in the original dataset.
 14. MeanTimeDomainGravityAccelerometerStandardDeviationZ: Mean for the "tGravityAcc-std()-Z" variable, which is in the original dataset.
 15. MeanTimeDomainBodyAccelerometerJerkMeanX: Mean for the "tBodyAccJerk-mean()-X" variable, which is in the original dataset.
 16. MeanTimeDomainBodyAccelerometerJerkMeanY: Mean for the "tBodyAccJerk-mean()-Y" variable, which is in the original dataset.
 17. MeanTimeDomainBodyAccelerometerJerkMeanZ: Mean for the "tBodyAccJerk-mean()-Z" variable, which is in the original dataset.
 18. MeanTimeDomainBodyAccelerometerJerkStandardDeviationX: Mean for the "tBodyAccJerk-std()-X" variable, which is in the original dataset.
 19. MeanTimeDomainBodyAccelerometerJerkStandardDeviationY: Mean for the "tBodyAccJerk-std()-Y" variable, which is in the original dataset.
 20. MeanTimeDomainBodyAccelerometerJerkStandardDeviationZ: Mean for the "tBodyAccJerk-std()-Z" variable, which is in the original dataset.
 21. MeanTimeDomainBodyGyroscopeMeanX: Mean for the "tBodyGyro-mean()-X" variable, which is in the original dataset.
 22. MeanTimeDomainBodyGyroscopeMeanY: Mean for the "tBodyGyro-mean()-Y" variable, which is in the original dataset.
 23. MeanTimeDomainBodyGyroscopeMeanZ: Mean for the "tBodyGyro-mean()-Z" variable, which is in the original dataset.
 24. MeanTimeDomainBodyGyroscopeStandardDeviationX: Mean for the "tBodyGyro-std()-X" variable, which is in the original dataset.
 25. MeanTimeDomainBodyGyroscopeStandardDeviationY: Mean for the "tBodyGyro-std()-Y" variable, which is in the original dataset.
 26. MeanTimeDomainBodyGyroscopeStandardDeviationZ: Mean for the "tBodyGyro-std()-Z" variable, which is in the original dataset.
 27. MeanTimeDomainBodyGyroscopeJerkMeanX: Mean for the "tBodyGyroJerk-mean()-X" variable, which is in the original dataset.
 28. MeanTimeDomainBodyGyroscopeJerkMeanY: Mean for the "tBodyGyroJerk-mean()-Y" variable, which is in the original dataset.
 29. MeanTimeDomainBodyGyroscopeJerkMeanZ: Mean for the "tBodyGyroJerk-mean()-Z" variable, which is in the original dataset.
 30. MeanTimeDomainBodyGyroscopeJerkStandardDeviationX: Mean for the "tBodyGyroJerk-std()-X" variable, which is in the original dataset.
 31. MeanTimeDomainBodyGyroscopeJerkStandardDeviationY: Mean for the "tBodyGyroJerk-std()-Y" variable, which is in the original dataset.
 32. MeanTimeDomainBodyGyroscopeJerkStandardDeviationZ: Mean for the "tBodyGyroJerk-std()-Z" variable, which is in the original dataset.
 33. MeanTimeDomainBodyAccelerometerMagnitudeMean: Mean for the "tBodyAccMag-mean()" variable, which is in the original dataset.
 34. MeanTimeDomainBodyAccelerometerMagnitudeStandardDeviation: Mean for the "tBodyAccMag-std()" variable, which is in the original dataset.
 35. MeanTimeDomainGravityAccelerometerMagnitudeMean: Mean for the "tGravityAccMag-mean()" variable, which is in the original dataset.
 36. MeanTimeDomainGravityAccelerometerMagnitudeStandardDeviation: Mean for the "tGravityAccMag-std()" variable, which is in the original dataset.
 37. MeanTimeDomainBodyAccelerometerJerkMagnitudeMean: Mean for the "tBodyAccJerkMag-mean()" variable, which is in the original dataset.
 38. MeanTimeDomainBodyAccelerometerJerkMagnitudeStandardDeviation: Mean for the "tBodyAccJerkMag-std()" variable, which is in the original dataset.
 39. MeanTimeDomainBodyGyroscopeMagnitudeMean: Mean for the "tBodyGyroMag-mean()" variable, which is in the original dataset.
 40. MeanTimeDomainBodyGyroscopeMagnitudeStandardDeviation: Mean for the "tBodyGyroMag-std()" variable, which is in the original dataset.
 41. MeanTimeDomainBodyGyroscopeJerkMagnitudeMean: Mean for the "tBodyGyroJerkMag-mean()" variable, which is in the original dataset.
 42. MeanTimeDomainBodyGyroscopeJerkMagnitudeStandardDeviation: Mean for the "tBodyGyroJerkMag-std()" variable, which is in the original dataset.
 43. MeanFrequencyDomainBodyAccelerometerMeanX: Mean for the "fBodyAcc-mean()-X" variable, which is in the original dataset.
 44. MeanFrequencyDomainBodyAccelerometerMeanY: Mean for the "fBodyAcc-mean()-Y" variable, which is in the original dataset.
 45. MeanFrequencyDomainBodyAccelerometerMeanZ: Mean for the "fBodyAcc-mean()-Z" variable, which is in the original dataset.
 46. MeanFrequencyDomainBodyAccelerometerStandardDeviationX: Mean for the "fBodyAcc-std()-X" variable, which is in the original dataset.
 47. MeanFrequencyDomainBodyAccelerometerStandardDeviationY: Mean for the "fBodyAcc-std()-Y" variable, which is in the original dataset.
 48. MeanFrequencyDomainBodyAccelerometerStandardDeviationZ: Mean for the "fBodyAcc-std()-Z" variable, which is in the original dataset.
 49. MeanFrequencyDomainBodyAccelerometerMeanFrequencyX: Mean for the "fBodyAcc-meanFreq()-X" variable, which is in the original dataset.
 50. MeanFrequencyDomainBodyAccelerometerMeanFrequencyY: Mean for the "fBodyAcc-meanFreq()-Y" variable, which is in the original dataset.
 51. MeanFrequencyDomainBodyAccelerometerMeanFrequencyZ: Mean for the "fBodyAcc-meanFreq()-Z" variable, which is in the original dataset.
 52. MeanFrequencyDomainBodyAccelerometerJerkMeanX: Mean for the "fBodyAccJerk-mean()-X" variable, which is in the original dataset.
 53. MeanFrequencyDomainBodyAccelerometerJerkMeanY: Mean for the "fBodyAccJerk-mean()-Y" variable, which is in the original dataset.
 54. MeanFrequencyDomainBodyAccelerometerJerkMeanZ: Mean for the "fBodyAccJerk-mean()-Z" variable, which is in the original dataset.
 55. MeanFrequencyDomainBodyAccelerometerJerkStandardDeviationX: Mean for the "fBodyAccJerk-std()-X" variable, which is in the original dataset.
 56. MeanFrequencyDomainBodyAccelerometerJerkStandardDeviationY: Mean for the "fBodyAccJerk-std()-Y" variable, which is in the original dataset.
 57. MeanFrequencyDomainBodyAccelerometerJerkStandardDeviationZ: Mean for the "fBodyAccJerk-std()-Z" variable, which is in the original dataset.
 58. MeanFrequencyDomainBodyAccelerometerJerkMeanFrequencyX: Mean for the "fBodyAccJerk-meanFreq()-X" variable, which is in the original dataset.
 59. MeanFrequencyDomainBodyAccelerometerJerkMeanFrequencyY: Mean for the "fBodyAccJerk-meanFreq()-Y" variable, which is in the original dataset.
 60. MeanFrequencyDomainBodyAccelerometerJerkMeanFrequencyZ: Mean for the "fBodyAccJerk-meanFreq()-Z" variable, which is in the original dataset.
 61. MeanFrequencyDomainBodyGyroscopeMeanX: Mean for the "fBodyGyro-mean()-X" variable, which is in the original dataset.
 62. MeanFrequencyDomainBodyGyroscopeMeanY: Mean for the "fBodyGyro-mean()-Y" variable, which is in the original dataset.
 63. MeanFrequencyDomainBodyGyroscopeMeanZ: Mean for the "fBodyGyro-mean()-Z" variable, which is in the original dataset.
 64. MeanFrequencyDomainBodyGyroscopeStandardDeviationX: Mean for the "fBodyGyro-std()-X" variable, which is in the original dataset.
 65. MeanFrequencyDomainBodyGyroscopeStandardDeviationY: Mean for the "fBodyGyro-std()-Y" variable, which is in the original dataset.
 66. MeanFrequencyDomainBodyGyroscopeStandardDeviationZ: Mean for the "fBodyGyro-std()-Z" variable, which is in the original dataset.
 67. MeanFrequencyDomainBodyGyroscopeMeanFrequencyX: Mean for the "fBodyGyro-meanFreq()-X" variable, which is in the original dataset.
 68. MeanFrequencyDomainBodyGyroscopeMeanFrequencyY: Mean for the "fBodyGyro-meanFreq()-Y" variable, which is in the original dataset.
 69. MeanFrequencyDomainBodyGyroscopeMeanFrequencyZ: Mean for the "fBodyGyro-meanFreq()-Z" variable, which is in the original dataset.
 70. MeanFrequencyDomainBodyAccelerometerMagnitudeMean: Mean for the "fBodyAccMag-mean()" variable, which is in the original dataset.
 71. MeanFrequencyDomainBodyAccelerometerMagnitudeStandardDeviation: Mean for the "fBodyAccMag-std()" variable, which is in the original dataset.
 72. MeanFrequencyDomainBodyAccelerometerMagnitudeMeanFrequency: Mean for the "fBodyAccMag-meanFreq()" variable, which is in the original dataset.
 73. MeanFrequencyDomainBodyBodyAccelerometerJerkMagnitudeMean: Mean for the "fBodyBodyAccJerkMag-mean()" variable, which is in the original dataset.
 74. MeanFrequencyDomainBodyBodyAccelerometerJerkMagnitudeStandardDeviation: Mean for the "fBodyBodyAccJerkMag-std()" variable, which is in the original dataset.
 75. MeanFrequencyDomainBodyBodyAccelerometerJerkMagnitudeMeanFrequency: Mean for the "fBodyBodyAccJerkMag-meanFreq()" variable, which is in the original dataset.
 76. MeanFrequencyDomainBodyBodyGyroscopeMagnitudeMean: Mean for the "fBodyBodyGyroMag-mean()" variable, which is in the original dataset.
 77. MeanFrequencyDomainBodyBodyGyroscopeMagnitudeStandardDeviation: Mean for the "fBodyBodyGyroMag-std()" variable, which is in the original dataset.
 78. MeanFrequencyDomainBodyBodyGyroscopeMagnitudeMeanFrequency: Mean for the "fBodyBodyGyroMag-meanFreq()" variable, which is in the original dataset.
 79. MeanFrequencyDomainBodyBodyGyroscopeJerkMagnitudeMean: Mean for the "fBodyBodyGyroJerkMag-mean()" variable, which is in the original dataset.
 80. MeanFrequencyDomainBodyBodyGyroscopeJerkMagnitudeStandardDeviation: Mean for the "fBodyBodyGyroJerkMag-std()" variable, which is in the original dataset.
 81. MeanFrequencyDomainBodyBodyGyroscopeJerkMagnitudeMeanFrequency: Mean for the "fBodyBodyGyroJerkMag-meanFreq()" variable, which is in the original dataset.
