#A matrix can have all th elements of same datatype
matrix()
rbind()
cbind()

#matrix()
?matrix

my.data <- 1:20
my.data

A <- matrix(my.data,4,5)
A

A[2,3]

B <- matrix(my.data,4,5,byrow = TRUE)
B

B[2,5]

#rbind()

r1 <- c("I","am","Happy")
r2 <- c("What", "a","day")
r3 <- c(1,2,3)

C <- rbind(r1,r2,r3)
C

#cbind()

c1 <- c("I","am","Happy")
c2 <- c("What", "a","day")
c3 <- c(1,2,3)

D <- cbind(c1,c2,c3)
D





