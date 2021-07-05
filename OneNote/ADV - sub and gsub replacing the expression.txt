getwd()
setwd("F:\\R Programs\\Dataset")

fin <- read.csv("P3-Future-500-The-Dataset.csv")
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

#sub() and gsub()

fin$Expenses <- gsub(" Dollars","",fin$Expenses)
fin$Expenses <- gsub(",","",fin$Expenses)
head(fin)

fin$Revenue <- gsub("\\$","",fin$Revenue)
fin$Revenue <- gsub(",","",fin$Revenue)
head(fin)

fin$Growth <- gsub("\\%","",fin$Growth)
head(fin)
