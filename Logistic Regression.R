
### Logistic regression  ###

## Transforms the prob of an event into log odds
## logit fn: log(p/1-p)

 
#### Student application ###


#library(readr)
require(tidyverse)
binary <- read_csv("C:/Users/Wero_Setem_12/Desktop/Datasets/binary.csv")


#### Explore the data ###
str(binary)
binary %>% 
  glimpse()

binary$admit<-as.factor(binary$admit) ## 0 not, 1 yes
binary$rank<-as.factor(binary$rank)

binary %>% 
  tail()

#install.packages("dataMaid")
library(dataMaid)

makeDataReport(binary, output = "html", replace = T)


ggplot(binary, aes(x= gre,
                   y= admit))+
  geom_point(aes(color="red"))




                              

library(caret)
library(caTools)

### Split the data
set.seed(111)
Sample<-sample(2, size = nrow(binary), 
               replace = T, prob = c(.8, .2))

Train<- subset(binary, Sample==1)
Test<-subset(binary, Sample==2)

### Fit the model ###


###############################################


glm(admit ~ rank, 
    data= binary,
    family = "binomial")



summary(glm(admit ~ ., 
            data= binary,
            family = "binomial"))




############################################

(Logit_model<- glm(admit~., 
                  data = Train, 
                  family ="binomial"))
Logit_model
summary(Logit_model)

# Y= a + B1x1 + B2x2 + ... Bnxn
# P_Admit= -4.34 + 0.003*gre + 0.75*gpa +  -0.55*Rank2  
-4.338445/1.290612

### Predict ###
P1<- round(predict(Logit_model, Train, type = "response"))

P1 %>% 
  head()

table(Predictions = P1,
      Actual = Train$admit)



 #### Test
 Pred_2 <- round(predict(Logit_model,
                         Test, 
                         type = "response"))

 Tab<- table(Prediction=Pred_2, Actual=Test$admit) 
Tab

1- sum(diag(Tab)/ sum(Tab))
sum(diag(Tab)/ sum(Tab))





ggplot(data=binary, aes(x=gre, 
                        y=admit))+
  geom_point()+
  stat_smooth( method = "glm",
              method.args = list(family=binomial()))


