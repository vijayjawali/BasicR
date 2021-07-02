getwd()
setwd("F:\\R Programs\\Dataset")

fin <- read.csv("P3-Future-500-The-Dataset.csv",na.strings = c(""))
head(fin,15)
str(fin)
summary(fin)

#changing from non factor to factor
fin$Name <- as.factor(fin$Name)
fin$Industry <- as.factor(fin$Industry)
fin$State <- as.factor(fin$State)
fin$City <- as.factor(fin$City)
fin$Revenue <- as.factor(fin$Revenue)
fin$Expenses <- as.factor(fin$Expenses)
fin$Growth <- as.factor(fin$Growth)
fin$ID <- as.factor(fin$ID)
fin$Inception <- as.factor(fin$Inception)
str(fin)
summary(fin)

#fvt EXAMPLE


fin$Profit <- as.factor(fin$Profit)
head(fin)
str(fin)
fin$Profit <- as.numeric(as.character(fin$Profit))
head(fin)


#sub() and gsub()

fin$Expenses <- gsub(" Dollars","",fin$Expenses)
fin$Expenses <- gsub(",","",fin$Expenses)
head(fin)

fin$Revenue <- gsub("\\$","",fin$Revenue)
fin$Revenue <- gsub(",","",fin$Revenue)
head(fin)

fin$Growth <- gsub("\\%","",fin$Growth)
head(fin)

str(fin)


fin$Expenses <- as.numeric(fin$Expenses)
fin$Revenue <- as.numeric(fin$Revenue)
fin$Growth <- as.numeric(fin$Growth)



#Filtering using which()
head(fin)
fin[fin$Revenue == 9746272,]
#ID     Name Industry Inception Employees State       City Revenue Expenses  Profit Growth
#3       3 Greenfax   Retail      2012        NA    SC Greenville 9746272  1044375 8701897     16
#NA   <NA>     <NA>     <NA>      <NA>        NA  <NA>       <NA>      NA       NA      NA     NA
#NA.1 <NA>     <NA>     <NA>      <NA>        NA  <NA>       <NA>      NA       NA      NA     NA

which(fin$Revenue == 9746272)
#> which(fin$Revenue == 9746272)
#[1] 3
fin[which(fin$Revenue == 9746272),]



