rm(list = ls())

data <- matrix(runif(100, 0, 10), ncol = 2)
colnames(data) <- c('x', 'y')
plot(data)
centroidNumber <- 4

mykmeans(data, centroidNumber)
