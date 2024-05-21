library("BB")
library(tidyverse)

setwd("/Users/calebhill/Documents/UNH/Research/code/github/graph_21b/")
  

n <- 22  # number of parameters
k <- 100 #number of different start points
p0 <- matrix(runif(n*k, -2, 2), k, n)
ans <- multiStart(par=p0, fn=g21b_Sys, action="optimize", quiet=TRUE) 
result <- as_tibble(ans) %>% filter(converged == TRUE) %>% filter(fvalue < 1)

# now write to a file called "approx21b_many.txt"



