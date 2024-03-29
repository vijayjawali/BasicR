getwd()
setwd("F:\\R Programs\\Dataset")
stats <- read.csv("P2-Demographic-Data.csv")
stats[1:10,]
stats[c(4,60),]
stats[1,]
is.data.frame(stats[1,]) # TRUE
stats[,1]
is.data.frame(stats[,1]) # FALSE
is.data.frame(stats[,1,drop=F]) # False
#multiply columns
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

#add column
stats$newcolumn <- stats$Birth.rate + stats$Internet.users
stats

#remove a column
stats$newcolumn <- NULL
stats
