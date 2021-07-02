getwd()
setwd("F:\\R Programs\\Dataset")


#Read CSV file and replace "" with NA
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
TRUE == FALSE #FALSE
TRUE == 5 #FALSE
TRUE == 1 #TRUE
FALSE == 4 #FALSE
FALSE == FALSE #TRUE
FALSE == 0 #TRUE

NA == TRUE #NA
NA == FALSE #NA
NA == 15 #NA
15 == NA #NA
NA == NULL #NA

head(fin,24)
#Filter NA rows
fin[!complete.cases(fin),]

#Filtering using is.na() for missing data
head(fin)

fin[fin$Expenses == NA,]
#> fin[fin$Expenses == NA,]
#ID Name Industry Inception Employees State City Revenue Expenses Profit Growth
#NA    <NA> <NA>     <NA>      <NA>        NA  <NA> <NA>      NA       NA     NA     NA
#NA.1  <NA> <NA>     <NA>      <NA>        NA  <NA> <NA>      NA       NA     NA     NA
#NA.2  <NA> <NA>     <NA>      <NA>        NA  <NA> <NA>      NA       NA     NA     NA
#NA.3  <NA> <NA>     <NA>      <NA>        NA  <NA> <NA>      NA       NA     NA     NA
#NA.4  <NA> <NA>     <NA>      <NA>        NA  <NA> <NA>      NA       NA     NA     NA
#NA.5  <NA> <NA>     <NA>      <NA>        NA  <NA> <NA>      NA       NA     NA     NA
#NA.6  <NA> <NA>     <NA>      <NA>        NA  <NA> <NA>      NA       NA     NA     NA
#NA.7  <NA> <NA>     <NA>      <NA>        NA  <NA> <NA>      NA       NA     NA     NA
#NA.8  <NA> <NA>     <NA>      <NA>        NA  <NA> <NA>      NA       NA     NA     NA


  
a <- c(1,77,354,NA,7,0,99)
is.na(a)
#[1] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE

fin[is.na(fin$Expenses),]
#> fin[is.na(fin$Expenses),]
#ID      Name     Industry Inception Employees State     City  Revenue Expenses   Profit Growth
#8   8 Rednimdox Construction      2013        73    NY Woodside       NA       NA       NA     NA
#17 17   Ganzlax  IT Services      2011        75    NJ   Iselin 14001180       NA 11901180     18
#44 44 Ganzgreen Construction      2010       224    TN Franklin       NA       NA       NA      9
