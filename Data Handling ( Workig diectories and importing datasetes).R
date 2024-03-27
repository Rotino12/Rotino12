

##  Working directories  ##
##  Importing Data sets  ##

## Working directories.


getwd()
setwd("C:\\Users\\Wero_Setem_12\\Desktop\\R")
setwd("C:\\Users\\Wero_Setem_12\\Desktop\\R")
getwd()

setwd("C:/Users/Wero_Setem_12/Desktop/Datasets")



     ## Slashes ##


getwd()


## connecting to data sets

### Inbuilt datasets.

 ## datasets::iris

  ## csv, excel, stata, SPSS.

## Reading flat files (comma separated values CSV)

#install.packages("readr")

require(readr)
library(readr)

## Move the data set into your current directory
Diabetes<-read_csv("diabetes_risk_prediction_dataset.csv")


## Data not in the current working directory.

## you must provide the full file  path

Binnary<-read_csv("C:\\Users\\Wero_Setem_12\\Desktop\\Datasets\\binary.csv")
Binnary



## Excel 
 #install.packages("readxl")
library(readxl)

Data_1 <- read_excel("C:/Users/Wero_Setem_12/Desktop/R/Data_1.xlsx", 
                     sheet = "Sheet1")
View(Data_1)


Data_2 <- read_excel("C:/Users/Wero_Setem_12/Desktop/R/Data_1.xlsx", 
                     sheet = "Sheet2", range = "A1:D10", na = "\" \"")
View(Data_2)

library(readxl)
Data_Two <- read_excel("Data_1.xlsx", sheet = "Sheet2", 
                       range = "A1:D10", na = "\"\"")
View(Data_Two)

## SPSS and STATA 


## SPSS
library(haven)
Sav<- read_sav("C:/Users/Wero_Setem_12/Desktop/Datasets/Sav.sav")
View(Sav)


####   Stata

library(haven)
Macro <- read_dta("C:/Users/Wero_Setem_12/Desktop/Datasets/Macro.dta")
View(Macro)

str(Macro)
