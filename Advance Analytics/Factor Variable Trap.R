#Factor variable Trap (FVT)
#converting into numeric for characters
a <- c("12","13","14","12","12")
a
typeof(a)
b <- as.numeric(a)
b
typeof(b)

#converting into numeric for factors
z <- factor(c("12","13","14","12","12"))
z
typeof(z)
y <- as.numeric(z)
y

# Correct Way

x <- as.numeric(as.character(z))
x
