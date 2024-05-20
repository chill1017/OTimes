library("BB")
library(tidyverse)

setwd("/Users/calebhill/Documents/UNH/Research/code/github/graph_21b/")



g21b_Sys <- function(beta){
  
  n <- 
  F <- rep(NA,n)
  
  F[1] <- -34.86361658353044 + 7.58257569495584*beta[1]^2 + 6.*(1. + beta[4]^2 + beta[8]^2)

  norm(as.matrix(F))^2
}



n <-  # number of parameters
k <- 100 #number of different start points
p0 <- matrix(runif(n*k, -1, 1), k, n)
ans <- multiStart(par=p0, fn=g21b_Sys, action="optimize", quiet=TRUE) 
result <- as_tibble(ans) %>% filter(converged == TRUE) %>% filter(fvalue < 1)

# now write to a file called "approx21b_many.txt"



