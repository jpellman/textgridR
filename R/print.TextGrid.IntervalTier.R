print.TextGrid.IntervalTier <- function(x) {
  summary(x)
    xminvals <- sapply(x, function(y) {as.double(y$xmin)})
    xmaxvals <- sapply(x, function(y) {as.double(y$xmax)})
    textvals <- sapply(x, function(y) {y$text})
  itf <- data.frame(xminvals, xmaxvals, textvals)
  names(itf) <- c("Start Point:", "End Point:", "Text:")
  itf
}