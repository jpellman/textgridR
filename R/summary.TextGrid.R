# Generic functions shouldn't really need any extra documentation.

summary.TextGrid <- function(x){
  cat("Tiered?: ")
  if (attributes(x)$tiers){
    cat("Yes\n")
  } else {
    cat("No\n")
  }
  cat("Number of Tiers: ")
  cat(attributes(x)$size)
  cat("\n")
  cat("Names of Tiers: \n")
  cat(attributes(x)$names)
  cat("\n\n")
  cat("Start Point: ")
  cat(attributes(x)$xmin)
  cat("\n")
  cat("End Point: ")
  cat(attributes(x)$xmax)
  #cat("\n\n")
  # Maybe add the total number of intervals to this as well.
}