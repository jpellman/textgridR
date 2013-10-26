#' @name search.TextGrid
#' @title Search a TextGrid for an Interval
#' @description Searches a TextGrid for a specific Interval.
#' 
#' @param textgrid The TextGrid object to search.
#' @param tier If it is known, you can specify the name of the tier that contains the Interval as a character vector.
#' @param xmin The beginning time point for the Interval, rounded to a whole integer.
#' @param xmax The end time point for the Interval, rounded to a whole integer.
#' @param point A time point if the Interval is an individual time point.
#' @param text The annotation for the Interval.
#' 
#' @return A two element vector containing the indices for the first Interval object matching the arguments and its IntervalTier.
#' 
#' @author John Pellman

search.TextGrid <- function(textgrid, tier, xmin, xmax, point=NULL, text){
  # Checks to see if 'textgrid' is missing.  Throws error if missing.
  if(missing(textgrid) | is.null(textgrid)){
    stop("Error: No argument for 'textgrid'.")
  }
  # If point is not null, set xmin and xmax to point.
  # This function uses integers to avoid weird rounding errors.
  if (!is.null(point)){
    xmin <- as.integer(point)
    xmax <- as.integer(point)
  } else {
    xmin <- as.integer(xmin)
    xmax <- as.integer(xmax)
  }
  
  # If tier is unspecified, iterate through each tier of textgrid.
  if (missing(tier)){
    # Currently implemented using a for loop.  Perhaps change this to an apply-like function later (maybe use a helper function?).
    for (i in 1:length(textgrid)){
    # Extract the xmin, xmax, and text values for each tier using sapply and store in vectors.
      xminvals <- sapply(textgrid[[i]], function(x) {as.integer(x$xmin)})
      xmaxvals <- sapply(textgrid[[i]], function(x) {as.integer(x$xmax)})
      textvals <- sapply(textgrid[[i]], function(x) {x$text})
    # Use which() to retrieve indices where the vectors are equal to xmin, xmax, text.
    xminindices <- which(xminvals==xmin)
    xmaxindices <- which(xmaxvals==xmax)
    textindices <- which(xmaxvals==xmax)
    # Find the intersection of these indices.
      intervalindex <- intersect(intersect(xminindices, xmaxindices), textindices)
      if (!is.null(intervalindex)){
        intervaltierindex <- i
        break;
      } else {
        intervaltierindex <- NULL
      }
    }
  } else {
    # Prepares the IntervalTier.
    tier <- as.character(tier)
    #Defines intervaltierindex.
    intervaltierindex <- which(names(textgrid)==tier)
    tier <- textgrid[[tier]]
    # Extract the xmin, xmax, and text values for each tier using sapply and store in vectors.
    xminvals <- sapply(tier, function(x) {as.integer(x$xmin)})
    xmaxvals <- sapply(tier, function(x) {as.integer(x$xmax)})
    textvals <- sapply(tier, function(x) {x$text})
    # Use which() to retrieve indices where the vectors are equal to xmin, xmax, text.
    xminindices <- which(xminvals==xmin)
    xmaxindices <- which(xmaxvals==xmax)
    textindices <- which(xmaxvals==xmax)
    # Find the intersection of these indices.
    intervalindex <- intersect(intersect(xminindices, xmaxindices), textindices)
  }
  indices <- c(intervaltierindex, intervalindex)
  indices
}