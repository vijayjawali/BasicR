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

head(fin,24)
#Filter NA rows
fin[!complete.cases(fin),]

#Filtering using which()
head(fin)
fin[fin$Revenue == 9746272,]
which(fin$Revenue == 9746272)
#> which(fin$Revenue == 9746272)
#[1] 3
fin[which(fin$Revenue == 9746272),]



#Filtering using is.na() for missing data
head(fin)

fin[fin$Expenses = NA,]

a <- c(1,77,354,NA,7,0,99)
is.na(a)

fin[is.na(fin$Expenses),]

#Removing Data with missing Records
fin_backup <- fin

fin[!complete.cases(fin),]
fin[is.na(fin$Industry),]
fin[!is.na(fin$Industry),]
fin <- fin[!is.na(fin$Industry),]
fin

#Resetting DataFrame Index
#First way
rownames(fin) <- 1:nrow(fin)
rownames(fin)
#Second way
rownames(fin) <- NULL
rownames(fin)

#Replacing Missing Data : Factual Analysis
fin[is.na(fin$State),]
fin[is.na(fin$State) & fin$City == "New York",]
fin[is.na(fin$State) & fin$City == "New York","State"] <- "NY"
fin


#Check
fin[c(11,377),]


fin[is.na(fin$State),]
fin[is.na(fin$State) & fin$City == "San Francisco",]
fin[is.na(fin$State) & fin$City == "San Francisco","State"] <- "CA"

#Check
fin[c(82,265),]


#Replacing Missing Data : Median imputation Method
fin[!complete.cases(fin),]
med_empl_retail <- median(fin[fin$Industry == "Retail","Employees"], na.rm = TRUE)
med_empl_retail
fin[is.na(fin$Employees) & fin$Industry == "Retail",]
fin[is.na(fin$Employees) & fin$Industry == "Retail","Employees"] <- med_empl_retail
fin[is.na(fin$Employees) & fin$Industry == "Retail",]

fin[!complete.cases(fin),]
med_empl_financial_services <- median(fin[fin$Industry == "Financial Services","Employees"], na.rm = TRUE)
med_empl_financial_services
fin[is.na(fin$Employees) & fin$Industry == "Financial Services",]
fin[is.na(fin$Employees) & fin$Industry == "Financial Services","Employees"] <- med_empl_financial_services
fin[is.na(fin$Employees) & fin$Industry == "Financial Service",]

#Replacing Missing Data : Median imputation Method Part 2
fin[!complete.cases(fin),]
med_growth_construction <- median(fin[fin$Industry == "Construction","Growth"], na.rm = TRUE)
med_growth_construction
fin[is.na(fin$Growth) & fin$Industry == "Construction",]
fin[is.na(fin$Growth) & fin$Industry == "Construction","Growth"] <- med_growth_construction
fin[is.na(fin$Growth) & fin$Industry == "Construction",]

#Replacing Missing Data : Median imputation Method Part 3
fin[!complete.cases(fin),]
med_revenue_const <- median(fin[fin$Industry == "Construction","Revenue"], na.rm = TRUE)
med_revenue_const
fin[is.na(fin$Revenue) & fin$Industry == "Construction",]
fin[is.na(fin$Revenue) & fin$Industry == "Construction","Revenue"] <- med_revenue_const
fin[is.na(fin$Revenue) & fin$Industry == "Construction",]


fin[!complete.cases(fin),]
med_expenses_construction <- median(fin[fin$Industry == "Construction","Expenses"], na.rm = TRUE)
med_expenses_construction
fin[is.na(fin$Expenses) & fin$Industry == "Construction" & is.na(fin$Profit),]
fin[is.na(fin$Expenses) & fin$Industry == "Construction","Expenses"] <- med_expenses_construction
fin[is.na(fin$Expenses) & fin$Industry == "Construction",]

#Replacing Missing Data : Deriving Values Method
# Revenue - Expenses = Profit
# Expenses = Revenue - Profit

fin[!complete.cases(fin),]
fin[is.na(fin$Profit), "Profit"] <- fin[is.na(fin$Profit), "Revenue"] - fin[is.na(fin$Profit), "Expenses"]
fin[c(8,42),]

fin[!complete.cases(fin),]
fin[is.na(fin$Expenses), "Expenses"] <- fin[is.na(fin$Expenses), "Revenue"] - fin[is.na(fin$Expenses), "Profit"]
fin[c(15),]

#Visualizing
library(ggplot2)
#• A scatterplot classified by industry showing revenue, expenses, profit 
p <- ggplot(data = fin)
p + geom_point(aes(x = Revenue, y = Expenses, colour = Industry, size = Profit))

#• A scatterplot that includes industry trends for the expenses~revenue relationship 
d <- ggplot(data = fin, aes(x = Revenue, y = Expenses, colour = Industry))
d + geom_point() +
  geom_smooth(fill = NA, size = 1.2)

#• BoxPlots showing growth by industry
f <- ggplot(data = fin, aes(x = Industry, y = Growth, colour = Industry))
f + geom_jitter() + geom_boxplot(size = 1, alpha = 0.5, outlier.color = NA)
