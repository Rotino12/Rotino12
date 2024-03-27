

   ## R for Data Science ##
# Vector, Matrix, Dataframe, List.

## Vector
# The easiest way to store multiple data types of the same class
## created by c, rep and seq functions.


Vector_1<- c(T, F,F, T, F,T)

Vector_2 <- c("One", "Two", "Three",
              "Four", "Five", "Six")

Vector_3<- rep(10, 6)
?rep

Vector_4 <- rep(c(1,2,3),2)

Vector_4 <- rep(1:3, 2)
Vector_4

Vector_5<- seq(1,6, 1)
?seq

# R is a vectorized language.
# Most computations will focus on vectors.

Vector_1

Vector_1[1]
Vector_1[6]

Vector_1[3:5]

Vector_3[-3]

Vector_2[-3]

# Operation on vectors

Vector_4*2
Vector_6<-Vector_3+Vector_3
Vector_6

Vector_6/2


## Matrix
# Two dimensional arrays arranged in a rectangular layout
# Vector in two dimensions
# Can contain same or different data type

?matrix
Matrix_1<-matrix(1:20, ncol = 4, nrow = 5,
                 byrow = F)
Matrix_1

Matrix_2<- matrix(1:20, ncol = 4, byrow = T)
Matrix_2

colnames(Matrix_1)<- c("one", "Two", "Three", "Four")
rownames(Matrix_1)<-c("A","B", "C", "D", "E")
Matrix_1

## Operations on matrices
# Matrix[rowno, colno]

Matrix_1[1,1]

Matrix_1[2,4]

Matrix_1[1,]  ## Entire row 1
Matrix_1[,1]


Matrix_1[1,] * Matrix_2[1,]

Matrix_1[1,1]<-100
Matrix_1

Matrix_1[2,]<- rep(100:103)
Matrix_1


Matrix_3<-matrix(1:9, ncol = 3)
Matrix_4<- matrix(1:12, ncol = 4)
Matrix_5<-matrix(2:10, ncol=3)

Matrix_1+ Matrix_2 ## same dim
dim(Matrix_1)

dim(Matrix_2)
Matrix_3 + Matrix_4


# Multiplication
# 1 element wise

Matrix_3*Matrix_5
Matrix_3
Matrix_5

Matrix_3*Matrix_5


Matrix_3%*%Matrix_5


2 + 12+28

# Transpose
Matrix_1
t(Matrix_1)


# Rows sum and columns sum
colSums(Matrix_1)
rowSums(Matrix_1)


## Data frames.
## Two dimensional array, table with rows and columns
# rows are observations and columns are variables
# Each column have the same data type and each row is unique.


Data_1<-data.frame(Vector_2,Vector_1,Vector_3,
                   Vector_4, Vector_5)
class(Data_1)

str(Data_1)

## sub-setting data frames
# 1. matrix like [row, column]

Data_1[6,1] # row six, column one

Data_1[,2] ## Second column
Data_1[2,] ## Second row

## 2. Sub-setting using column name

Data_1$Vector_4


Data_1[,4] ## Matrix like sub-setting.

## Conditional selection
## ==, >, =>, <=, |, &, != $

## Vector_4 equal to 2
Data_1[Data_1$Vector_4==2,]

# Vector_5 >3
Data_1[Data_1$Vector_5>3,]

# Less than
Data_1[Data_1$Vector_4 < 2,]

# Less than or greater than

Data_1[Data_1$Vector_5>=4,]

Data_1[Data_1$Vector_5<=3,] 

## Not equal to

Data_1[Data_1$Vector_1 !="TRUE",]
Data_1[Data_1$Vector_1 == "FALSE",]

## And &
# Vector_1 is TRUE and Vector_5 >=3
Data_1[Data_1$Vector_1=="TRUE" & Data_1$Vector_5>=3,]


# Or |
# Vector_1 is TRUE or Vector_5 <= 3
Data_1[Data_1$Vector_1=="TRUE" | Data_1$Vector_5 <= 3,]


## List
# a special type of structure where each element can 
# of different type.

List_1<- list(Vector_1, Matrix_1, Data_1)

