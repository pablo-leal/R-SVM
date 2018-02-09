
install.packages("dplyr")
library('dplyr')

#  E1071 is the package that contains the classification function.  In this example we are using it for the
#  SUPPORT VECTOR MACHINE (svm) function.
install.packages("e1071")
library(e1071)

#  CARET is a set of functions that attempt to streamline the process for creating predictive models.
install.packages("caret")
library(caret)

setwd ("/Users/Pabloleal/...")
#  The data file has a data dictionary.  
bankSample <- read.csv('bank.csv', sep = ';')
#  Look at the first rows of the data
head(bankSample)

#  So some more R gymnastics.  This code sample creates a function call naColumns.  The function performs the
#  following steps:
#
#       1.  df is a data frame passed to the function
#       2.  any(is.na(x) returns any row number where there is missing data
#       3.  lapply(df, function(x) any(is.na(x)) applies any(is.na(x) to the data frame df
#       4.  unlist takes the output from lapply and creates a vector out of it
#       5.  colnames(df) then lists the columns of df that have missing data as the row numbers are given by unlist
naColumns <- function(df) {
  colnames(df)[unlist(lapply(df, function(x) any(is.na(x))))]
}

#  Apply naColumns to the data to determine if there are any rows with missing data
naColumns(bankSample)

#
#  Now we do the predictions.
#
#  Partitioning Data into Train and Test datasets in 70:30.  createDataPartition() is in the caret package.  The output
#  of createDataPartition is a list (or vector) of index numbers.  each index number is a row (i.e., potential new
#  customer in the bankSample that is part of the training data.  If a row in bankSample is not in train2 then it is
#  in the test data.  The test data index list is denoted by -train2.)
set.seed(1234567)
train2<-createDataPartition(bankSample$y,p=0.7,list=FALSE)
head(train2)

#  Set train to be the training data and test to be the test data.  The statement bankSample[train2,] means to take the
#  rows listed in train2 and assign them to train and include all the columns (that is why the ,] is used.  It means take
#  all of the columns.  The statement bankSample[-train2,] means to take all the rows that are not listed in train2.
train<-bankSample[train2,]
test<-bankSample[-train2,]
head(train)
head(test)

#  This is where we create the predictive model based on the training data
train.svm<-svm(y~.,train,kernel="polynomial",cost=0.01,scale=TRUE,degree=3,gamma=1)
summary(train.svm)

#  This is where we determine the model accuracy.  predict() applies the model to the test data.
test.svm<-predict(train.svm,test)

#  table() shows the contingency table for the outcome of the prediction.  Each cell in a contingency table that counts
#  how many times that row-column combination occurred:
table(predict=test.svm,truth=test$y)

#  How can SVM use mixed data because it has numbers and factors?
sapply(test, class)

#  The SVM will handle both category and continuous variables as long as you perform preprocessing.  All features
#  should be scaled or normalised. The SVM algorithm will handle features that are continuous or categorical.
#  Factors in R are stored as a vector of integer values with a corresponding set of character values to use when the
#  factor is displayed.

