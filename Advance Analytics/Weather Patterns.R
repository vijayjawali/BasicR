getwd()
setwd("F:\\R Programs\\Dataset\\P3-Weather-Data\\Weather Data")
Chicago <- read.csv("Chicago-C.csv", row.names = 1)
Chicago
NewYork <- read.csv("NewYork-C.csv", row.names = 1)
NewYork
Houston <- read.csv("Houston-C.csv", row.names = 1)
Houston
SanFrancisco <- read.csv("SanFrancisco-C.csv", row.names = 1)
SanFrancisco

#Convert fron DataFrames to Matrices
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

#Put all the names in a List
Weather <- list(Chicago = Chicago, NewYork = NewYork, Houston = Houston, SanFrancisco = SanFrancisco)
Weather

Weather[2]
Weather[[3]]
Weather$Houston

apply(Chicago, 1, mean)

apply(Chicago, 1, max)

apply(Chicago, 1, min)

apply(Chicago, 1, mean)
apply(NewYork, 1, mean)
apply(Houston, 1, mean)
apply(SanFrancisco, 1, mean)

#using lapply()

t(Chicago)
mynewlist <- lapply(Weather,t)

rbind(Chicago, NewRow = 1:12)
lapply(Weather, rbind, NewRow = 1:12)

#rowmeans
#colMeans
#rowSums
#colSums

?rowMeans
rowMeans(Chicago)
lapply(Weather, rowMeans)


#Combining lapply() with [ ] operator

Weather$Chicago[1,1]
Weather[[1]][1,1]
lapply(Weather, "[", 1, 1)
lapply(Weather, "[", 1, )
lapply(Weather,"[", ,3)

#Adding your own function in lapply()

lapply(Weather, rowMeans)
lapply(Weather, function(x) x[1,])
lapply(Weather, function(x) x[,12])
lapply(Weather, function(z) z[1,] - z[2,])
lapply(Weather, function(z) round((z[1,] - z[2,]) / z[2,],2)) 

#sapply()
?sapply()

lapply(Weather, "[",1,7)
sapply(Weather, "[",1,7)
lapply(Weather, "[",1,10:12)
sapply(Weather, "[",1,10:12)
lapply(Weather, rowMeans)
sapply(Weather, rowMeans)
sapply(Weather, function(z) round((z[1,] - z[2,]) / z[2,],2)) 

#Same as Lapply
sapply(Weather, function(z) round((z[1,] - z[2,]) / z[2,],2), simplify = FALSE)

#Nesting Apply Functions
lapply(Weather, rowMeans)

Chicago
apply(Chicago, 1, max)
lapply(Weather, apply, 1, max)

#2nd method
lapply(Weather, function(x) apply(x,1,max))

#sapply
sapply(Weather, apply, 1, max)
sapply(Weather, function(x) apply(x,1,max))


#which.max
Chicago
which.max(Chicago[1,])
names(which.max(Chicago[1,]))
apply(Chicago, 1, function(x) names(which.max(x)))
lapply(Weather, function(y) apply(y, 1, function(x) names(which.max(x))))
sapply(Weather, function(y) apply(y, 1, function(x) names(which.max(x))))