**Script Design**
===========
The Github repo contains only one R script (run_analysis.R).
**Assumptions:**
----
 - Variable names in the submitted tidy dataset follows the Camel naming scheme.  This is due to long variable names.
 - The script should be placed in the folder that contains the train, test and the rest of data files.
 - setwd() should used to set the working directory to be the same folder that contains the data and the run_analysis.R.

**Script Flow:**
----
 1. Read activity_labels.csv, features.txt, X_train.txt, X_test.txt, y_train.txt, y_test.txt, subject_train.txt and subject_test.txt
 2. replace the activity id by the actual activity name for the training and the testing data.
 3. Append the SubjectId column to the training dataset and the same for the testing dataset.
 4. Append the ActivityLevel column to the training dataset and the same for the testing dataset.
 5. Append a DataType column which differentiate train dataset from testing dataset.
 6. Merge the training dataset and the testing dataset called "all.data".
 7. Create subset dataset from the dataset ,which is created in the previous step, that contains SubjectId,ActivityLevel and any column contains mean or standard deviation measure. I assumed that any column cotains "-mean" will hold mean measure. If it contains "-std" will hold standard deviation measure.
 8. Create "Avg.Data" dataset which contains the mean for each variable extracted in the previous step per SubjectId per ActivityLevel.
