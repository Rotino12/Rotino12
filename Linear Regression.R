     ###Predictive Modelling 1 ###
        ## linear Regression ##

# install.packages("tidyverse")
library(tidyverse)

 ## Datasets ##

trees
help("trees")



ggplot( data = trees, aes(x= Girth, y= Volume))+
  geom_jitter(aes(col="red"))+
  geom_smooth(aes(y=Volume, x=Girth), method = "lm")+
  theme_minimal()+
  ggtitle("Girth explaining Volume")


# Can The volume of a tree be predicted using its Girth
# What value in V changes when Girth changes by 1 unit.
# Prop of V explained by Girth.


lm(Volume~ Girth, data = trees)

Lm_model<-lm(Volume~ Girth, data = trees) 

attributes(Lm_model)

summary(Lm_model)

# P value
# Y= a + B1x1 + e
# Y= a + B1x1 + ...BnXn + e
# a= Intercept
#-36.9435, Volume of a tree with Girth zero.

#B1= slope.
# For a unit change in Girth, Volume increases by 5.07.


# R square. 
# Prop of dependent var that can be explained by independent var
# .93 ~ 94%

## Adjusted R-squared.
 ## Y= -36.94 + 5.06*X1 + e
-36.94 + 5.06*100

### Multiple Linear Regression

trees %>% 
  lm(Volume ~ ., data=.) %>% 
  summary()

Lm_model_1<- lm(Volume~ Girth + Height , data = trees)
summary(Lm_model_1)
# Y= -57.98 + 4.71*X1 + 0.3393*X2.


attributes(Lm_model_1)
## Residuals

hist(Lm_model_1$residuals)


predict(Lm_model_1, trees)
cbind(trees,Pred_values=predict(Lm_model_1, trees))


