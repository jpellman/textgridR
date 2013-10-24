#' @name add.Interval
#' @title Add an Interval to a TextGrid
#' @description Adds an Interval to a specified IntervalTier within a TextGrid.
#' 
#' @param textgrid The TextGrid object to modify.
#' @param tier The name of the IntervalTier as a character vector.
#' @param xmin The beginning time point for the Interval to be inserted.
#' @param xmax The end time point for the Interval to be inserted.
#' @param text The annotation for the Interval to be inserted.
#' 
#' @return A TextGrid object with the Interval added.
#' 
#' @author John Pellman

add.Interval <- function(textgrid, tier, xmin, xmax, text){
  # Checks to see if 'textgrid' is missing.  Throws error if missing.
  if(missing(textgrid) | is.null(textgrid)){
    stop("Error: No argument for 'textgrid'.")
  }
  # Prepares the IntervalTier.
  tier <- as.character(tier)
  tier <- textgrid[[tier]]
  if (is.null(tier)) stop("Error: IntervalTier is null.  Perhaps 'tier' was mistyped.")
  # Extracts all of the tierxmins from the IntervalTier
  tierxmins <- sapply(tier, function(x) x$xmin)
  # Prepares the Interval object.
  interval <- TextGrid.Interval(xmin, xmax, text)
  # Adds the xmin value of the new Interval to tierxmins
  tierxmins[length(tierxmins)+1] <- xmin
  # Determines the index where the interval shold be added.
  addIndex <- findInterval(xmin, sort(tierxmins))
  # Re-creates the IntervalTier unless the add index is greater than the length of the tier,
  # in which case the interval is added to the end.
  if (addIndex <= length(tier)){
    firsthalf <- tier[[1:addIndex-1]]
    secondhalf <- tier[[addIndex:length(tier)]]
    firsthalf <- c(firsthalf, interval)
    tier <- c(firsthalf, secondhalf)
  } else {
    tier[[addIndex]] <- interval
  }
  textgrid[[tier]] <- tier
  textgrid
}