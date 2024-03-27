
   #### FUNCTIONS ####
## self contained modules, block of code performing certain task ##
  mean(c(1,100,300))
   sum(c(1,100,300))/3
   
 # Inbuilt functions.
# Mathematical.
   abs(-5)
   sqrt(9)
   exp()
# statistical functions.
   mean()
   median()
# data manipulation functions.
   
# File input/ output functions.   
   read.csv()
   
   


# writing your functions. (User defined functions)

   ## Name unique
   ## What it does
   ## Arguments
   ## Commenting
   
   # F<-function( arguments ){
   # what the function does
   #  }

Multiply_10 <- function(Number){
 print(Number)  
 (Number*10)  # you can explicitly provide return before number
  
}

Multiply_10(5)


Summation<- function(A,B,C){
  print(A,B,C)
  return(A+B+C) # simple adder
}

Summation(5,10,15)


Circum<-function(D){
  print(D)
  return(pi*D)
}

Circum(100)
