         ## R FOR DATA SCIENCE ##
       ## Data types ##
## Forms in which different variables are interpreted by machines.
# Logical, Numeric, character, complex and factor.
# Data frame in R to perform conversion.
#Use typeof() to check the type of data type. 

# Logical/Boolean

 # Take the value TRUE and FALSE.
 # Used to check for conditions

x<- TRUE
x

y= FALSE

x==y
?typeof()
typeof(x)

# In numerical interpretations, T evaluates to 1, F to zero

TRUE+TRUE

FALSE==0


## Numeric
## can either be integer(Non decimal) and double (Decimal).
## Doubles are explicitly stored as numeric in R.
## You introduce Capital L after a number to make it an integer.

10
typeof(10)

10L

typeof(10L)

Int_1<- 10L
typeof(Int_1)

# Use as.integer(), as.double() for conversion.

K<-(as.double(Int_1))

typeof(K)



## Character
# data type that is in form words rather than numerals
# Enclosed in double or single quotes

Age<- "Five years"
Z<- 'Two'

class(Z)

## stringr


## Complex.
# Comprises of a number that have real and imaginary part
## < Real > + < Imaginary >i 
sqrt(-9)
sqrt(-9i)

Complex_1<- -1 + 0i

typeof(Complex_1)

##  Factor
## data that is used to refer to a qualitative relationship
## For example gender, grades.
Factor<- factor(c("good", "better", "worst"))
class(Factor)

levels(Factor)
nlevels(Factor)

#install.packages("tidyverse")
library(tidyverse)

?mpg
mpg
head(mpg)
str(mpg)

unique(mpg$cyl) # $ and unique
mpg$cyl

mpg$cyl<-as.factor(mpg$cyl)
str(mpg)

mpg$hwy<-as.double(mpg$hwy)E
