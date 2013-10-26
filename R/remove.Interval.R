#' @name remove.Interval
#' @title Remove an Interval with certain characteristics from a TextGrid
#' @description Removes an Interval from a specified IntervalTier within a TextGrid.
#' 
#' @param textgrid The TextGrid object to modify.
#' @param tier The name of the IntervalTier as a character vector.
#' @param xmin The beginning time point for the Interval.
#' @param xmax The end time point for the Interval.
#' @param text The annotation for the interval.
#' 
#' @return  A TextGrid object with the Interval removed.
#' 
#' @author John Pellman

remove.Interval <- function(textgrid, tier, xmin, xmax, text){
  # If an Interval is removed, the xmin and xmax values for the IntervalTier containing it should be modified accordingly.
  # This function should allow for missing arguments- have it find the most similar Intervals
  # print them out to the user and stop if it finds more than one Interval so that the user
  # can be more specific.
  # Checks to see if 'textgrid' is missing.  Throws error if missing.
  if(missing(textgrid) | is.null(textgrid)){
    stop("Error: No argument for 'textgrid'.")
  }
  # Finds the interval in the TextGrid.
  indices <- search.TextGrid(textgrid=textgrid, tier=tier, xmin=xmin, xmax=xmax, point=NULL, text=text)
  # Prepares the IntervalTier.
  tierchar <- names(textgrid[indices[1]])
  tier <- textgrid[[indices[1]]]
  if (is.null(tier)) stop("Error: IntervalTier is null.  Perhaps 'tier' was mistyped.")
  firsthalf <- tier[[1:(indices[2]-1)]]
  secondhalf <- tier[[(indices[2]+1):length(tier)]]
  tier <- c(firsthalf, secondhalf)
  textgrid[[tierchar]] <- tier
  textgrid
}