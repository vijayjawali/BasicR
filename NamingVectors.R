#Named vector
charlie <- 1:5
charlie

#give names
names(charlie) <- c("a","b","c","d","e")
charlie
charlie["c"]

#clear names
names(charlie) <- NULL
charlie


#naming matrix dimension
temp.vec <- rep(c("a","B","ZZ"), each = 3)
temp.vec

Bravo <- matrix(temp.vec,3,3)
Bravo

rownames(Bravo) <- c("How","are","you")
Bravo

colnames(Bravo) <- c("one","two","three")
Bravo

Bravo["are","two"] <- 0
Bravo
