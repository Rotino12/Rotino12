 ### HYPOTHESIS TESTING ##
 
## t-test, z test and Chi-square.

#### t-test ###
        ## Is the sample mean equal to population mean
        ## one sample t-test
        ## paired t-test
        ## one sided t-test
        ## two sided t-test

#install.packages("tidyverse")
library(tidyverse)
head(diamonds)
?diamonds
 
## One sample t-test (single sample)

# Ho:  mean is equal to 3000 
# H1: mean is not equal to 3000.

   ## if P< 0.05, reject the null hypothesis

## Test it at 95% C.I, alpha =.05, 5%



diamonds %>% 
  filter(cut=="Ideal") %>% 
  select(price) %>% 
  t.test(mu =3000 )


 
## P < 0.05 we reject the null hypothesis.

## Two sided.
## Is the difference between the means equal to zero

# Ho: Mean difference is equal to zero.
# H1: Mean difference is not equal to zero.
diamonds %>% 
  filter(cut %in% c("Premium", "Ideal" )) %>% 
  t.test(price ~ cut, data=.,
         alternative = "two.sided")




## One sided t-test
## is the mean of one  variable less than the other

# Ho: premium diamonds have mean less than ideal
# H1: premium diamonds mean is not less than ideal
 
diamonds %>% 
  filter(cut %in% c("Premium", "Ideal" )) %>% 
  t.test(price ~ cut, data=.,
         alternative = "less",
         conf.level = .95)


## Paired t-test
# Testing same variable, in two different occasions.
# medical research, economic growth at two different years.

# Ho: There is no difference in means before and after.
# H1: There is difference in means before and after.

Before<- c(45,67,89,65,67,80)
After <- c(58, 78,96, 76,80, 88 )

t.test(After, Before, paired = TRUE)


