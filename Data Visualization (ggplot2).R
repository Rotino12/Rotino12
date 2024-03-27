
#### Data Visualization ##
    # ggplot 2 ##
## The greatest value of a picture is when it shows us 
## things we never expected to see

 # install.packages("tidyverse")
library(tidyverse)

## Question
# 1. Two continuous variables ( scatter plot)
?mtcars

head(mtcars)
glimpse(mtcars)

mtcars$cyl<-as.factor(mtcars$cyl)
mtcars$vs<-as.factor(mtcars$vs)
mtcars$am<-as.factor(mtcars$am)
mtcars$carb<-as.factor(mtcars$carb)
mtcars$gear<-as.factor(mtcars$gear)

glimpse(mtcars)

## Scatter plots
ggplot(data = mtcars)

ggplot(data = mtcars, mapping = aes(x=mpg,
                                  y= disp))+
  geom_point()

## Negative relationship.

ggplot(data = mtcars, mapping = aes(x=mpg,
              y= disp, size=am))+
  geom_point(mapping = aes(), color="blue")


ggplot(data = mtcars, mapping = aes(x=mpg,
                                    y= disp, shape=gear))+
  geom_point(mapping = aes(), color="maroon")


ggplot(data = mtcars, mapping = aes(x=mpg,
           y= disp, color= vs))+
  geom_point()+
  xlab("fuel consumption")+
  ylab(" Displacement covered")+
  ggtitle("Negative relatioship between mpg and disp")

## facet

## facet wrap
ggplot(data = mtcars, mapping = aes(x=mpg,
                                    y= disp, color= vs))+
  geom_point()+
  xlab("fuel consumption")+
  ylab(" Displacement covered")+
  ggtitle("Negative relatioship between mpg and disp")+
  facet_wrap( ~ carb)
 ### facet grid
ggplot(data = mtcars, mapping = aes(x=mpg,
                                    y= disp, color= vs))+
  geom_point()+
  labs(title = "Displacement vs Fuel consumption per gear and carb",
       subtitle ="Negative relatioship between mpg and disp")+
       xlab("fuel consumption")+
       ylab(" Displacement covered")+
  facet_grid(gear~carb)

 



## bar plot
  ## Gives count per each categorical variable
head(mtcars)  
ggplot(data = mtcars, mapping = aes(x=cyl))+
  geom_bar()
  
mtcars %>% 
  group_by(cyl) %>% 
  count()


head(mtcars)  
ggplot(data = mtcars, mapping = aes(x=cyl,
      color= vs ), color= vs)+
  geom_bar()+
  ggtitle("Counts of Cyl")

 ## fill color
ggplot(data = mtcars, mapping = aes(x=cyl, 
                              fill= vs))+
  geom_bar()+
  ggtitle("Counts of Cyl")

## Positional adjustments

ggplot(data = mtcars)+
  geom_bar( mapping = aes(x=cyl, 
      fill= vs), position="dodge")


  

## Histogram
## One continuous variable.

ggplot(data = mtcars)+
  geom_histogram(mapping = aes(x=disp), binwidth = 45)
 

## Freqpoly
ggplot(data = mtcars)+
  geom_freqpoly(mapping = aes(x=disp, color=am), binwidth = 45) 


ggplot(data = mtcars, mapping = aes(x=disp))+
  geom_freqpoly(mapping = aes(color=cyl), binwidth=40)





## Boxplot
## One categorical and one continuous

boxplot(mtcars$drat, col = 5)


ggplot(data=mtcars, mapping = aes(y=disp))+
  geom_boxplot()
 

ggplot(data=mtcars, mapping = aes(x=carb, y=disp,
       color=carb))+
  geom_boxplot()


## coord_flip
ggplot(data=mtcars, mapping = aes(x=cyl, y=disp,
       color=as.factor(cyl)))+
  geom_boxplot()+
  coord_flip()


## Heat maps (Two continuous variables)
# group the data by two categorical variables

?diamonds
head(diamonds)

D1<-diamonds %>% 
  group_by(cut, color) %>% 
  tally() %>% 
  arrange(desc(n)) %>% 
  view()
 
 


ggplot(data = D1, mapping =  aes(x=cut, y=color, fill=n))+
  geom_tile()+
  scale_fill_gradient(low = "white", high = "blue")+
  labs(title = "Heat map", subtitle = "Ideal and G are the most abadunt")

## Pie chart
head(diamonds)

Data_one<-diamonds %>% 
  count(cut) %>%
  arrange(desc(n)) %>% 
  view()


ggplot(data=Data_one, aes(cut, y=n))+
  geom_bar(stat = "identity")

ggplot(data=Data_one, aes(cut, y=n, fill=cut))+
  geom_col()

ggplot(data=Data_one, aes(cut, y=n, fill=cut))+
  geom_col()+
  coord_polar()


ggplot(data=Data_one, aes(x=cut, y=n, fill=cut))+
  geom_col()+
  coord_polar(theta = "y")


ggplot(data=Data_one, aes(x="", y=n, fill=cut))+
  geom_col(color="black")+
  coord_polar(theta = "y")+
  theme_void()
 




