#Select the file manually
stats <- read.csv(file.choose())
stats

#select working Directory abd read data
getwd()
setwd("F:\\R Programs\\Dataset")
stats <- read.csv("P2-Demographic-Data.csv")

#Exploring Data
stats
nrow(stats)
ncol(stats)
head(stats)
tail(stats)
str(stats)
summary(stats)

#The $ sign
stats
stats[3,3]
stats[3,"Birth.rate"]
stats$Internet.users
stats$Internet.users[2]
stats[,"Internet.users"]
levels(stats$Income.Group)
