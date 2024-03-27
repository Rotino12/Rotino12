## HYPOTHESIS TESTING ##

## Categorical variables.

##   goodness of fit
##   test of independence

## Goodness of fit
## is proportion of categorical variables in a data set
## the same at a certain C.F
#install.packages(tidyverse)
library(tidyverse)
tail(diamonds)


ggplot(data= diamonds, mapping = aes(x=cut, fill=cut))+
  geom_bar()

Tab<-table(diamonds$cut)
Tab
## H0: the proportion of cut is the same ( equal)
## H1: the proportion of cut are not the same

chisq.test(Tab)
 chisq.test(table(diamonds$cut)) 
 
 
 ## Chi square test of independence.
 head(diamonds)
 # Ho diamonds cut and color are dependent.
 # H1 diamonds cut and color are independent.
 
 table(diamonds$cut, diamonds$color)
 
 Chi_sq<-chisq.test(table(diamonds$cut, diamonds$color))
Chi_sq 
 
 