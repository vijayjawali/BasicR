#List Components
#Character: Machine name 
#Vector: (min, mean, max) utilisation for the month (excluding unknown hours) 
#Logical: Has utilisation ever fallen below 90%? TRUE / FALSE 
#Vector: All hours where utilisation is unknown (NA’s) 
#Dataframe: For this machine 
#Plot: For all machines

getwd()
setwd("F:\\R Programs\\Dataset")
util <- read.csv("P3-Machine-Utilization.csv")
head(util)
str(util)
util$Timestamp <- as.factor(util$Timestamp)
util$Machine <- as.factor(util$Machine)
summary(util)
#Add utilization column utilization = 1-idle
util$Utilization <- 1- util$Percent.Idle
head(util,20)

#Handling Date-Time
tail(util)
?POSIXct
util$PosixTime <- as.POSIXct(util$Timestamp, format = "%d/%m/%Y %H:%M")
head(util)
summary(util)
util$Timestamp <- NULL
util <- util[,c(4,1,2,3)]

#What is a List ?
summary(util)
RL1 <- util[util$Machine == "RL1",]
summary(RL1)
RL1$Machine <- factor(RL1$Machine)
str(RL1)

#Construct List
#Character: Machine name 
#Vector: (min, mean, max) utilisation for the month (excluding unknown hours) 
#Logical: Has utilisation ever fallen below 90%? TRUE / FALSE 

util_stats_rl1 <- c(min(RL1$Utilization, na.rm = T), 
                    mean(RL1$Utilization, na.rm = T),
                    max(RL1$Utilization, na.rm = T))
util_stats_rl1

util_under_90_flag <- length(which(RL1$Utilization < 0.90)) > 0
util_under_90_flag

list_rl1 <- list("RL1",util_stats_rl1,util_under_90_flag)
list_rl1

#Naming Components of a List
list_rl1
names(list_rl1) <- c("Machine","Stats","LowThreshold")
list_rl1
#2nd Method
rm(list_rl1)
list_rl1 <- list(Machine = "RL1",Stats = util_stats_rl1,LowThreshold = util_under_90_flag)
list_rl1

#Extracting Components of a List
#Three ways:
#[] - will always return a list
#[[]] - will always return the actual object
#$ - same as [[]] but convenient

list_rl1
list_rl1[1]

list_rl1[[1]]
list_rl1$Machine


list_rl1[2]
typeof(list_rl1[2])


typeof(list_rl1[[2]])
list_rl1$Stats
typeof(list_rl1$Stats)


#How to access the 3rd element of the vector ina list (max utilization)
list_rl1$Stats[3]
list_rl1[[2]][3]

#Adding and Deleting components in a List
list_rl1
list_rl1[4] <- "New Information"
list_rl1

#Another Way
#Vector: All hours where utilisation is unknown (NA’s) 
list_rl1$UnknownHours <- RL1[is.na(RL1$Utilization),"PosixTime"]
list_rl1

#Remove a component
list_rl1[4] <- NULL
list_rl1

#Add another Component (Dataframe)
list_rl1$Data <- RL1
list_rl1

summary(list_rl1)


#Subsetting a List
list_r1

list_rl1[[4]][1]
list_rl1$UnknownHours[1]

list_rl1[1:4]
list_rl1[c(1,4)]

sublist_rl1 <- list_rl1[c("Machine","Stats")]
sublist_rl1

sublist_rl1$Stats[2]


#Creating a timeseries Plot
library(ggplot2)

p <- ggplot(data = util)
p + geom_line(aes(x = PosixTime, y = Utilization, colour = Machine), size = 1.2) + 
  facet_grid(Machine~.) + geom_hline(yintercept = 0.90, colour = "Gray", size = 1.2, linetype = 3)

myplot <- p + geom_line(aes(x = PosixTime, y = Utilization, colour = Machine), size = 1.2) + 
  facet_grid(Machine~.) + geom_hline(yintercept = 0.90, colour = "Gray", size = 1.2, linetype = 3)

#Adding Plot to a List
list_rl1$myplot <- myplot
list_rl1
summary(list_rl1)
str(list_rl1)
