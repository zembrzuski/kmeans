computeDistanceBetweenPoints <- function (centroid, point) {
  sqrt((centroid[1]-point[1])^2 + (centroid[2]-point[2])^2)
}

computeDistanceForCentroids <- function(point, centroids) {
  distances <- c()
  
  for (i in 1:nrow(centroids)) {
    centroid <- centroids[i,]
    distance <- computeDistanceBetweenPoints(centroid, point)
    
    distances <- c(distances, distance)
  }
  
  distances
}


# this function receives an array like [1.2, 5.5, 0.4]
# this input means that the centroid-1 is within 1.2 for a point p,
# centroid-2 is within 5.5 for a point p, and centroid-3 is within 0.4 
# for a point p.
# then, this function will return 3, becouse 3 is the index (the number that identifies)
# the closest centroid
chooseIndexOfClosestCentroid <- function(centroidsDistances) {
  which(centroidsDistances %in% min(centroidsDistances))[1]
}



clustering <- function(data, centroids) {
  myCluster <- data.frame()
    
  for (i in 1:nrow(data)) {
    point <- data[i,]
    distances <- computeDistanceForCentroids(point, centroids)
    closestCentroidIndex <- chooseIndexOfClosestCentroid(distances)
    myCluster <- rbind(myCluster, c(closestCentroidIndex, i))
  }
  
  colnames(myCluster) <- c('centroidIndex', 'pointIndex')
  myCluster
}

# this function is awful. :(
areGroupsEqual <- function(group1, group2) {
  if (is.null(dim(group1))) {
    return(FALSE)
  }
  
    
  for (i in 1:nrow(group1)) {
    for (j in 1:ncol(group1[1,])) {
      if (group1[i,j] != group2[i,j]) {
        return(FALSE)
      }
    }
  }
  
  return(TRUE)
}