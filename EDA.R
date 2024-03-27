# Exploratory Data Analysis.
      ## It involves the use of graphics,visualization,
      ## statistics and domain knowledge to explore and 
      ## Explore data set.

### 1. Measures of Normality## GRAPHICAL AND STATISTICAL METHODS.
### 2. Measures of Central Tendancy## MEAN, MEDIAN.
### 3. Measures of Dispersion## VARINCE AND STD. 
### 4. Measures of Relationships## correlation and covariance.

# 1. Measures of Normality.
## Some statistical tests makes assumptions
# that data sets are normally distributed.

 ## Statistical Methods.
# Kolmogorov-Smirnov (K-S) and Shapiro Wilk,s Test
## We first state the hypotheses 
# Ho: Data is from normal distributed population
# H1: Data is from non normal distributed population.
#####  if the p- value < a=.05, reject Ho


#  Shapiro Wilk,s Test.
set.seed(111) ## To make the output reproducible.
 
Data_1<-rnorm(50)  ## Normal dist data
Data_2<-rexp(50,2) ## exponential distribution.

# Ho: Data set follows Gaussian distribution, Normal
# H1: Data set follows non Gaussian distribution.
# P<.05, reject Ho, # p> .05 we fail to reject Ho

shapiro.test(Data_1)
shapiro.test(Data_2)
0.060>.05

## P value is less than 0.05, 
# reject Ho
#so the data is not normally dist

# Kolmogorov-smirnov test.
# Ho: data is from normal dist
# H1: data is from non normal distribution.
Data_3<- rnorm(300)
mean(Data_3)
sd(Data_3)
Data_4<- rexp(300, 3)

ks.test(Data_3, "pnorm")
ks.test(Data_4, "pnorm")




# 2. Graphical methods.
# Histogram and Q-Q plot.

# Histogram.
# Normally distributed if the histogram is roughly 
#" bell_shaped"

par(mfrow=c(2,2))
hist(Data_1, col = 3, xlab = "Data One")
hist(Data_2, col=4)
hist(Data_3, col = 5)
hist(Data_4, col = 6)
dev.off()
## Q-Q plot

## Points fall along a straight line
par(mfrow=c(2,2))
qqnorm(Data_1, col=5)
qqnorm(Data_2, col=4)
qqnorm(Data_3, col=3)
qqnorm(Data_4, col=2)
dev.off()

## Measures of Central Tendancy

# Mean, Median
## Mean ( Average value of a set of given data) ##
#Median ( It is the middle value when the data is arranged >|<) #

head(mtcars)
mean(mtcars$mpg)
Sum<-sum(mtcars$mpg)

library(tidyverse)
N<-mtcars %>% 
  select(mpg) %>% 
  count()

Sum/N

median(mtcars$mpg)



## Measures of Dispersion
#Dispersion is the spread or deviation of the data from a certain point
# Variance and Standard deviation

####  Variance  ### 
# Average degree to which a variable differs from its average.
# Deviation from the mean.

### Standard Deviation ###
## It is the square root of variance ##

var(mtcars$mpg)

## What it implies

var(mtcars$mpg) + mean(mtcars$mpg)
var(mtcars$mpg) - mean(mtcars$mpg)

## The lower the variance the better the stable the dataset
# estimator

sd(mtcars$mpg)



         ## Measures of Relationships ##
### Correlation and Covariance ###
## covariance is a statistical term use to measure
# the direction of linear relationship between variables

## Correlation measures the direction and strength and direction of 
## linear relationship between variables.
## Ranges from -1 to 1.

library(tidyverse)

cov(mtcars$mpg, mtcars$disp)

attach(mtcars)

cor(disp, mpg)
detach(mtcars)
## It negative, the tend to move in opposite direction
## The strength is strong, abs .8

cor(mtcars)

mtcars %>% 
  select(mpg, disp) %>% 
  cor()

library(psych)
head(iris)
iris %>% 
  select(-Species) %>% 
  pairs.panels()

cor(iris$Sepal.Length, iris$Sepal.Width)


## AUTOMATE.
library(dataMaid)
library(DataExplorer)

makeDataReport(data=diamonds, output = "html", replace = T)


create_report(diamonds)

library(SmartEDA)
ExpReport(diamonds, op_file = "Smart_diamonds_EDA")
