

        ## Control Flow ## 
  #if, if-else and nested if, loops and functions #
## The functions if, if-else and nested if are used in decision
# making 

# if- checks if one condition is true if so, an action is taken
## If statement is false nothing is done

# if (Condition is true){
      #Execute this statement.
#}
A<-10
B<-20

if(B-A>0){
  print("Positive Number")
}


## If-else.
# extension of if statement where you specify what 
# should be done if condition specified is false

# if ( Condition is true){
#     Execute
#     } else {
#     Execute this
#}


C <- 20
D <- 30

if( C-D < 0 ){
print ("Resultant Numeric is Negative")
} else{
  "Resultant Numeric is positive"
}


if( C-D > 0 ){
  print ("Resultant Numeric is Negative")
} else{
  "Resultant Numeric is positive"
}


##  if-else-if
# used when we have to make more than two decisions

# if (Condition 1){
#    Execute
#}else if(Condition 2){
#   Execute
#   .
#   .
#   .
#   Else
#   Execute
#}



E<-10


 if(E<10){
  print("E is less than 10")
}else if(E>10){
  print("E is greater than 10") 
  } else {
  print("E is equal to 10")  
}
