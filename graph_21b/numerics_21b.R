library("BB")
library(tidyverse)

setwd("/Users/calebhill/Documents/UNH/Research/code/OTimes/graph_21b/")
  

n <- 22  # number of parameters
k <- 5 #number of different start points
p0 <- matrix(runif(n*k, -.5, .5), k, n)
ans <- multiStart(par=p0, fn=g21b_Sys, action="optimize", quiet=TRUE) 
result <- as_tibble(ans) %>% filter(converged == TRUE) %>% filter(fvalue < 1)

# now write to a file called "approx21b_many.txt"



