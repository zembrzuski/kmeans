
# this function executes k-means and plot each iteration on a graphic, 
# to visualize how it works.
#
# data: a set of (x,y) points
# numberOfCentroids : numberOfCentroids
# return the data clustered in 'numberOfCentroids' 
mykmeans <- function(data, numberOfCentroids) {
  groups <- NULL
  
  centroids <- choseRandomCentroids(data, numberOfCentroids)
  newGroups <- clustering(data, centroids)
  
  while (!areGroupsEqual(groups, newGroups)) {
    doThePainting(newGroups, data)
    Sys.sleep(1)
    groups <- newGroups
    centroids <- chooseCentroids(groups, data, numberOfCentroids)
    newGroups <- clustering(data, centroids)
  }
  
  groups
}

