
## Joins and Merge ###

Pop_Df<- data.frame(Id=c(1,2,3,4,5), 
                    Country= c("A","B","C","D","F"),
                    Population=c(35, 70, 45, 56, 40))
Pop_Df


Sales_Df <- data.frame( Id=c(2,3,5,6,7),
                        Country=c("B", "C", "F", "G", "H"),
                        Sales_USD=c( 70, 45, 40, 67, 21))
Sales_Df 

## Base R function.

Df_3<- merge(Pop_Df, Sales_Df, by=c("Id", "Id"))  

Df_3

Df_3_4 = merge(Sales_Df, Pop_Df, by=c("Id", "Id"))
Df_3_4 

# joins ##
#install.packages("tidyverse")
library(tidyverse)
require(tidyverse)



## inner join includes only observations that 
## match in both the tables using the 
## The key provided, all other observations are dropped.

inner_join(Pop_Df, Sales_Df, by=c("Id"))


Pop_Df %>% 
  inner_join(Sales_Df, by="Id")

### Outer Joins ###, left, right and right join.

## Left keeps the observations in left table
Pop_Df%>% 
  left_join(Sales_Df, by="Id")


### right join keeps all the observations in the right table

Pop_Df%>% 
  right_join(Sales_Df, by="Id")


### full join keeps all the observations from all the tables
### Non matching values are filed with na
Pop_Df %>% 
  full_join(Sales_Df,by="Id")


### semi_join
## Keeps/ shows observation in the first table that have 
## matching values in the second table.
semi_join(Pop_Df, Sales_Df)


### anti_join
## Returns all the observations in the left(1st table)
## that do not have corresponding values in the right table

anti_join(Sales_Df, Pop_Df)
