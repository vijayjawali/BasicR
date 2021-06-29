#Numeric Vector
MyFirstVector <- c(3, 45, 67)
MyFirstVector
is.numeric(MyFirstVector)
is.integer(MyFirstVector)

#Integer Vector
V2 <- c(2L, 22L,6L)
is.numeric(V2)
is.double(V2)

#Character Vector
V3 <- c("a","Hello","Vector")
is.character(V3)
is.numeric(V3)

#Vector can have only one datatype
V4 <- c("a","Hello","Vector",7)
is.character(V4)
is.numeric(V4)

#Sequence
seq(1,15)
1:15

seq(1,20,3)
z<- seq(1,15,4)
z

#replicate
d <- rep(3,50)
d

a <- rep("a",5)
a

x <- c(10,20)
y <- rep(x,4)
y
