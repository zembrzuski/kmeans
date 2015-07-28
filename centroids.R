
# points: a set of (x,y) points
# numberOfCentroids : numberOfCentroids
# return random points in the region limited by the data of the input.
choseRandomCentroids <- function(points, numberOfCentroids) {
  randomX <- runif(numberOfCentroids, min(points[, 'x']), max(points[, 'x']))  
  randomY <- runif(numberOfCentroids, min(points[, 'y']), max(points[, 'y']))  
  
  matrix(c(randomX, randomY), ncol = 2)
}

# points: a set of (x,y) points
# return the central point of teh region limited by the points of the input.
computeCentralPoint <- function(points) {
  xCentral <- (min(points[, 'x']) + max(points[, 'x'])) /2
  yCentral <- (min(points[, 'y']) + max(points[, 'y'])) /2
  
  c(xCentral, yCentral)
}


# - clusters: is a data.frame with two columns: second column has the
#   index of a given point in 'points', and the first column has the
#   identifier for a cluster.
# - points : a set of (x, y) points
# - numberOfCentroids : number of centroids
# return - return the central point for each cluster 
chooseCentroids <- function(clusters, points, numberOfCentroids) {
  centroids <- data.frame()
    
  for (i in 1:numberOfCentroids) {
    filteredPointsIndexes <- which(clusters$centroidIndex == i)
    filteredDataSet <- points[filteredPointsIndexes,]
    
    newCentroid <- computeCentralPoint(filteredDataSet)
    centroids <- rbind(centroids, newCentroid)
  }
  
  centroids
}
