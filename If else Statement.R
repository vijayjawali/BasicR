x <- rnorm(1)
x
if(x>1){
  answer <- "Greater than 1"
  answer
} else{
    if(x >= -1){
      answer <- "Between -1 and 1"
      answer
    } else{
      answer <- "Less than 1"
      answer
    }
}