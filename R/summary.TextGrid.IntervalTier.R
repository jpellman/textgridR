summary.TextGrid.IntervalTier <- function(x){
  cat("IntervalTier Name: ")
  cat(attributes(x)$name)
  cat("\n")
  cat("IntervalTier Start Point: ")
  cat(attributes(x)$xmin)
  cat("\n")
  cat("IntervalTier End Point: ")
  cat(attributes(x)$xmax)
  cat("\n")
  cat("\n")
}