setwd("F:\\R Programs\\Dataset")
stats <- read.csv("P2-Demographic-Data.csv")

install.packages("ggplot2")
library(ggplot2)
?qplot()
qplot(data=stats, x=Internet.users, y=Birth.rate,colour=Income.Group, size=I(4))