   
   ## Classification ## 
#### K Nearest neighbors (Knn) #####
   # unsupervised Ml algorithm ##

## install.packages("tidyverse)
## install.packages("SmartEDA")
## install.packages( "caTools")
## install.packages( "caret")
## install.packages( " class")

  ### Explore the data ###

library(tidyverse)
iris %>% 
  glimpse()

str(iris)
library(SmartEDA)
ExpReport(iris, op_file = "SmartEDA.html")


##Split the data into Train and validation set##
library(caTools)
set.seed(1111)
iid<-sample.split(iris, SplitRatio = 0.8)

Train<- subset(iris, iid=="TRUE")
Test<- subset(iris, iid=="FALSE")

nrow(Train)
nrow(Test)


#### Scale the data ###
Train_Scale <- scale(Train[, 1:4])
Test_Scale <- scale(Test[,1:4])


Train_Scale %>% 
  tail()

head(Test_Scale)

### Fit the model ###
#install.packages("class")
require(class)

F_Knn <- knn(train= Train_Scale,
             test = Test_Scale,
             cl= Train$Species,
             k= round(sqrt(nrow(Train))))
F_Knn


### Model validation and confusion matrix ###
library(caret)
confusionMatrix(F_Knn, Test$Species)



#### Best Value of K ####

K_15 <- knn(train= Train_Scale,
    test = Test_Scale,
    cl= Train$Species,
    k= 15)

confusionMatrix(K_15, Test$Species)


K_2 <- knn(train= Train_Scale,
            test = Test_Scale,
            cl= Train$Species,
            k= 2)

confusionMatrix(K_2, Test$Species)





K_3 <- knn(train= Train_Scale,
            test = Test_Scale,
            cl= Train$Species,
            k= 3)

confusionMatrix(K_3, Test$Species)

