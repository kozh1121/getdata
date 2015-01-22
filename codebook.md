
## Code book ##

The variables in the provided UCI HAR Dataset archive are described in the file **features_info.txt**.

Data from test and train data sets were combined at one. Only the measurements of the mean and standard deviation were extracted. The columns with activity labels and subjects identification were added.

Average value were calculated for every subject (SubjectID) and activity (Activity) and assigned to ***result_dataset***. After that ***result_dataset*** was saved to **result.tst**.

**Columns of *result_dataset***
Activity                            
SubjectID                           
TimeBodyAccMeanX                    
TimeBodyAccMeanY                    
TimeBodyAccMeanZ                    
TimeGravityAccMeanX                 
TimeGravityAccMeanY                 
TimeGravityAccMeanZ                 
TimeBodyAccJerkMeanX                
TimeBodyAccJerkMeanY                
TimeBodyAccJerkMeanZ                
TimeBodyGyroMeanX                   
TimeBodyGyroMeanY                   
TimeBodyGyroMeanZ                   
TimeBodyGyroJerkMeanX               
TimeBodyGyroJerkMeanY               
TimeBodyGyroJerkMeanZ               
TimeBodyAccMagMean                  
TimeGravityAccMagMean               
TimeBodyAccJerkMagMean              
TimeBodyGyroMagMean                 
TimeBodyGyroJerkMagMean             
FFTBodyAccMeanX                     
FFTBodyAccMeanY                     
FFTBodyAccMeanZ                     
FFTBodyAccMeanFreqX                 
FFTBodyAccMeanFreqY                 
FFTBodyAccMeanFreqZ                 
FFTBodyAccJerkMeanX                 
FFTBodyAccJerkMeanY                 
FFTBodyAccJerkMeanZ                 
FFTBodyAccJerkMeanFreqX             
FFTBodyAccJerkMeanFreqY             
FFTBodyAccJerkMeanFreqZ             
FFTBodyGyroMeanX                    
FFTBodyGyroMeanY                    
FFTBodyGyroMeanZ                    
FFTBodyGyroMeanFreqX                
FFTBodyGyroMeanFreqY                
FFTBodyGyroMeanFreqZ                
FFTBodyAccMagMean                   
FFTBodyAccMagMeanFreq               
FFTBodyBodyAccJerkMagMean           
FFTBodyBodyAccJerkMagMeanFreq       
FFTBodyBodyGyroMagMean              
FFTBodyBodyGyroMagMeanFreq          
FFTBodyBodyGyroJerkMagMean          
FFTBodyBodyGyroJerkMagMeanFreq      
AngleTimeBodyAccMeanGravity         
AngleTimeBodyAccJerkMeanGravityMean 
AngleTimeBodyGyroMeanGravityMean    
AngleTimeBodyGyroJerkMeanGravityMean
AngleXGravityMean                   
AngleYGravityMean                   
AngleZGravityMean                   
TimeBodyAccStdX                     
TimeBodyAccStdY                     
TimeBodyAccStdZ                     
TimeGravityAccStdX                  
TimeGravityAccStdY                  
TimeGravityAccStdZ                  
TimeBodyAccJerkStdX                 
TimeBodyAccJerkStdY                 
TimeBodyAccJerkStdZ                 
TimeBodyGyroStdX                    
TimeBodyGyroStdY                    
TimeBodyGyroStdZ                    
TimeBodyGyroJerkStdX                
TimeBodyGyroJerkStdY                
TimeBodyGyroJerkStdZ                
TimeBodyAccMagStd                   
TimeGravityAccMagStd                
TimeBodyAccJerkMagStd               
TimeBodyGyroMagStd                  
TimeBodyGyroJerkMagStd              
FFTBodyAccStdX                      
FFTBodyAccStdY                      
FFTBodyAccStdZ                      
FFTBodyAccJerkStdX                  
FFTBodyAccJerkStdY                  
FFTBodyAccJerkStdZ                  
FFTBodyGyroStdX                     
FFTBodyGyroStdY                     
FFTBodyGyroStdZ                     
FFTBodyAccMagStd                    
FFTBodyBodyAccJerkMagStd            
FFTBodyBodyGyroMagStd               
FFTBodyBodyGyroJerkMagStd       

 