
# plot the graphic on screen
doThePainting <- function(myCluster, randomPoints) {
  colorMap = c('red', 'green', 'blue', 'black', 'gray')

  for (i in 1:nrow(myCluster)) {
    index <- myCluster[i,2]
    points(randomPoints[index,1], randomPoints[index,2], col=colorMap[myCluster[i,1]], pch = 19)
  }
}

