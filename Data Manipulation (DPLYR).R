## Install Tidyverse library.
## DPLYR Verbs.
## Pipe operator
## Data sets within R

# install.packages("tidyverse")
library(tidyverse)
require(tidyverse)
## DPLYR and DPLYR VERBS.
# They all behave the same way (Syntax).
# The first argument is a data frame, 2. what you want to do with 
# the data frame using var names, The results is a data frame.  


#1. Pick observations by their values ( filter())
## Allows you subset observations by their values.

# You can use comparison operators
# >, >=, <, <=, !=, and ==.

#### Logical operators ####
## & (and) and |(or)## 
#install.packages("tidyverse")
library(tidyverse)

head(mtcars)
str(mtcars)
glimpse(mtcars)
names(mtcars)

?mtcars
## Subset a data frame that meet certain condition using filter
## filter cars with carb equals to 2

mtcars[mtcars$carb==2,] ## R Traditional way

filter(mtcars, carb==2)


filter(mtcars, disp>=360)

mtcars %>%
  filter(disp>=360)
# You can use comparison operators
# >, >=, <, <=, !=, and ==.

    #### Logical operators ####
       ## & (and) and |(or)## 


filter(mtcars, mpg>20 & am==0) # and
filter(mtcars, mpg>20 | am==0) # or

filter(mtcars, am!=0 & mpg>20)


filter(mtcars, am ==1 &  mpg>20)

## and (&) and or (|) does not work as in it is in English
filter(mtcars, carb==2 | 4)

filter(mtcars, carb==2 | carb==4)

#2. Arrange Rows with arrange.
# It changes the order of rows.
#  arranges rows in ascending by default

arrange(mtcars, mpg)
arrange(mtcars, hp, wt) %>% 
  head()## by hp then by wt.


arrange(mtcars,  desc(carb)) %>% 
  head()   ## Arrange in desc order.


        ### 3. Select columns with select ###
 ## allows you select the columns you want to work with.

New_Data<-select(mtcars, mpg,disp,hp,drat)  
 

select(mtcars, vs:carb) %>% 
  tail(4)

select(mtcars, -(c(hp,carb,cyl,wt))) %>% 
  head(3)  ## Everything except hp, carb, cyl hp.

select(mtcars, ends_with("l")) %>% 
  head()

select(mtcars, starts_with("ge"))

select(mtcars, contains("e")) %>% 
  tail()

     ### 4. Add new variables with mutate###

mutate(mtcars,
       (Speed=disp/qsec)*4) %>% 
  head()


   ### 5. Grouped summaries with summarise ###

summarise(mtcars, mean(mpg))
summarise(mtcars, var(disp))

### summarise
Grouped_Cyl_Mean<-group_by(mtcars, cyl) ## creates a tibble,
Grouped_Cyl_Mean

summarise(Grouped_Cyl_Mean, mean(mpg))

mtcars %>% 
  group_by(cyl) %>% 
  summarise(mean(mpg))


###  PIPE OPERATOR ###
# magrittr package provides pipe (%>%).
# Use for chaining commands
 library(magrittr)
mtcars %>% 
  group_by(cyl) %>% 
  summarise(mean(mpg))


mtcars%>% 
  group_by(carb) %>%
  select(carb, disp, qsec)%>%
  mutate(Speed=(disp*qsec)*4) %>% 
  summarise(var(Speed))
  
# 6 Relocate
## Moves a column before or after a specified column
mtcars %>% 
  relocate(carb, .before = mpg) %>% 
  head()


mtcars %>% 
  relocate(vs:gear, .after=disp) %>% 
  head()

 
  


## slice
## Allows one to index rows by their integer locations
# select the row you need
mtcars %>% 
  slice(5) ## 5th row

mtcars %>% 
  slice_head(n=2)

head(mtcars, 2) ## Same as above

mtcars %>% 
  slice_tail(n=2)

tail(mtcars,2)

  

mtcars %>% 
  select(cyl, disp, carb, gear) %>% 
  arrange(cyl) %>% 
  slice_sample(n=7)

## Row wise

mtcars %>% 
  rowwise()%>%
  summarise(c_across(mean(everything())))


mtcars %>% 
  select(mpg, disp, qsec) %>%
  rowwise() %>% 
  summarise( Row_mean= mean(c_across(everything())))



mtcars %>% 
  select(mpg, disp, qsec) %>%
  rowwise() %>% 
  summarise( Row_max= max(c_across(everything())))

head(mtcars)


mtcars %>% 
  select(mpg, disp, qsec) %>%
  rowwise() %>% 
  summarise( Row_mean= min(c_across(everything()))) %>% 
  tail()








## Joins ###

Df_1<- data.frame(Id=c(1,2,3,4,5), 
                  Country= c("A","B","C","D","F"),
                  Pop=c(35, 70, 45, 56, 40))
Df_1


Df_2 <- data.frame( Id=c(2,3,5,6,7),
                    Country=c("B", "C", "F", "G", "H"),
                    Pop=c( 70, 45, 40, 67, 21))

Df_3<- merge(Df_1, Df_2, by=c("Id", "Id"))  ## Base R function.


# joins ##
library(tidyverse)

Df_4 <- data.frame( Id_1=c(2,3,5,6,7),
                    Country=c("B", "C", "F", "G", "H"),
                    Pop=c( 70, 45, 40, 67, 21))

inner_join(Df_1, Df_4, by=c("Id", "Id_1"))

Df_1 %>% 
  inner_join(Df_4, by=c("Id", "Id_1"))

            