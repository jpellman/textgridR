# Generic functions shouldn't really need any extra documentation.  This accepts Interval objects as input clearly.

print.TextGridInterval <- function(x){
  IntervalTable <- data.frame(x$xmin, x$xmax, x$text)
  names(IntervalTable) <- c("Start Point:", "End Point:", "Text:")
  print(IntervalTable)
}