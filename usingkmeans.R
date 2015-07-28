rm(list = ls())

setwd('/home/nozes/Desktop/studying/data_science_getting_guru/k-means-project/github/kmeans')
source('clustering.R')
source('graphics.R')
source('kmeans.R')
source('centroids.R')

data <- matrix(runif(100, 0, 10), ncol = 2)
colnames(data) <- c('x', 'y')
plot(data)
centroidNumber <- 4

mykmeans(data, centroidNumber)
