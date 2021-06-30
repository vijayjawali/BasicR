getwd()
setwd("F:\\R Programs\\Dataset")
movies <- read.csv("P2-Movie-Ratings.csv")
head(movies)
colnames(movies) <- c("film","genre","criticrating","audiencerating","budgetmillions","year")
head(movies)
tail(movies)
str(movies)
summary(movies)
movies$year <- factor(movies$year)
movies$film <- factor(movies$film)
movies$genre <- factor(movies$genre)
str(movies)

library(ggplot2)
#add geometry
ggplot(data=movies, aes(x=criticrating, y=audiencerating)) +
  geom_point()

#add color
ggplot(data=movies, aes(x=criticrating, y=audiencerating, colour=genre)) +
  geom_point()

#add size 
ggplot(data=movies, aes(x=criticrating, y=audiencerating, colour=genre, size=budgetmillions)) +
  geom_point()


#plotting with layers

p <- ggplot(data=movies, aes(x=criticrating, y=audiencerating, colour=genre, size=budgetmillions))
p

#point
p+geom_point()

#lines
p+geom_line()

#multiple layers
p+geom_line()+geom_point()
p+geom_point()+geom_line()


#overriding aesthetics
q <- ggplot(data=movies, aes(x=criticrating, y=audiencerating, colour=genre, size=budgetmillions))

#add geom layer
q+geom_point()

#override aes
q+geom_point(aes(size=criticrating))

q+geom_point(aes(colour=budgetmillions))

#override axis
q+geom_point(aes(x=budgetmillions)) +
  xlab("Budget in millions")

#reduce line size
p+geom_line(size=1)+geom_point()

#mapping vs setting
r <- ggplot(data= movies, aes(x=criticrating, y=audiencerating))
r+geom_point()

#add colour
#Mapping
r+geom_point(aes(colour=genre))

r+geom_point(aes(size=budgetmillions))


#setting
r+geom_point(colour="DarkGreen")

r+geom_point(size=0.1)


#Histogram and density charts

#Histogram
s <- ggplot(data=movies, aes(x=budgetmillions))
s+geom_histogram(binwidth = 10)

#add colour
s+geom_histogram(binwidth=10, aes(fill=genre))
#add a border
s+geom_histogram(binwidth=10, aes(fill=genre), colour="Black")

#density
s+geom_density(aes(fill=genre), position = "stack")

#Layering
t <- ggplot(data= movies, aes(x=audiencerating))
t+geom_histogram(binwidth=10,fill="White",colour="Blue")

#another way
t <- ggplot(data= movies)
t+geom_histogram(binwidth=10, aes(x=audiencerating),fill="White",colour="Blue")


t <- ggplot(data= movies)
t + geom_histogram(binwidth = 10, aes(x = criticrating), fill = "White", colour = "Blue")

#Statistical Transformation
?geom_smooth

u <- ggplot(data = movies, aes(x=criticrating, y=audiencerating,colour=genre))
u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(data = movies, aes(x=genre, y=audiencerating,colour=genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2) + geom_point()
u + geom_boxplot(size=1.2) + geom_jitter()
u + geom_jitter() + geom_boxplot(size=1.2, alpha = 0.5) 

#Facets

v <- ggplot(data = movies, aes(x = budgetmillions))
v + geom_histogram(binwidth = 10, aes(fill = genre), colour = "Black") +
  facet_grid(genre~., scales = "free")

#scatter
w <- ggplot(data = movies, aes(x=criticrating, y=audiencerating,colour=genre))
w + geom_point(size = 3)

w +  geom_point(size = 3) + facet_grid(genre~.)
w +  geom_point(size = 3) + facet_grid(.~year)

w +  geom_point(size = 3) + facet_grid(genre~year)
w +  geom_point(size = 3) + facet_grid(genre~year) + geom_smooth()

w +  geom_point(aes(size = budgetmillions)) + facet_grid(genre~year) + geom_smooth()

#Coordinates

#limits

m <- ggplot(data=movies, aes(x = criticrating, y = audiencerating, size = budgetmillions, colour = genre ))
m + geom_point()

m + geom_point() +
  xlim(50,100) +
  ylim(50,100)

#zoom
n <- ggplot(data=movies, aes(x = budgetmillions))
n + geom_histogram(binwidth = 10, aes(fill = genre), colour = "Black") +
  coord_cartesian(ylim = c(0,50))

w +  geom_point(aes(size = budgetmillions)) + facet_grid(genre~year) + geom_smooth() + 
  coord_cartesian(ylim = c(0,100))

#-----------------Theme
o <- ggplot(data=movies, aes(x=budgetmillions))
h <- o + geom_histogram(binwidth = 10, aes(fill = genre), colour = "Black")

