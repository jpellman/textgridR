#' @name search.TextGrid
#' @title Search a TextGrid for an Interval
#' @description Searches a TextGrid for a specific Interval.
#' 
#' @param textgrid The TextGrid object to search.
#' @param tier If it is known, you can specify the name of the tier that contains the Interval as a character vector.
#' @param xmin The beginning time point for the Interval.
#' @param xmax The end time point for the Interval.
#' @param point A time point if the Interval is an individual time point.
#' @param text The annotation for the Interval.
#' 
#' @return The index for the Interval object matching the arguments.
#' 
#' @author John Pellman

search.TextGrid <- function(textgrid, tier, xmin, xmax, point=NULL, text){
  # Checks to see if 'textgrid' is missing.  Throws error if missing.
  if(missing(textgrid) | is.null(textgrid)){
    stop("Error: No argument for 'textgrid'.")
  }
  # If point is not null, set xmin and xmax to point.
  if (!is.null(point)){
    xmin <- point
    xmax <- point
  } else {
    xmin <- as.double(xmin)
    xmax <- as.double(xmax)
  }
  
  # If tier is unspecified, iterate through each tier of textgrid.
  if (missing(tier)){
    # Currently implemented using a for loop.  Perhaps change this to an apply-like function later (maybe use a helper function?).
    for (i in 1:length(textgrid)){
    # Extract the xmin, xmax, and text values for each tier using sapply and store in vectors.
      xminvals <- sapply(textgrid[[i]], function(x) {x$xmin})
      xmaxvals <- sapply(textgrid[[i]], function(x) {x$xmax})
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
    tier <- textgrid[[tier]]
  }
}