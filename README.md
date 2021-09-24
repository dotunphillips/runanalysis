# Run Analysis

<p>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
</p>

<p>The R script called run_analysis.R does the following:</p> 

<ol>
  <li>Merges the training and the test sets to create one data set.</li>
  <li>Extracts only the measurements on the mean and standard deviation for each measurement.</li> 
  <li>Uses descriptive activity names to name the activities in the data set</li>
  <li>Appropriately labels the data set with descriptive variable names.</li> 
  <li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
  <li>The data set in step 5. is contained in the file called final_data.csv</li>
</ol>  
