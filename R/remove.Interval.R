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
#' @author John Pellman

remove.Interval <- function(textgrid, tier, xmin, xmax, text){
  # Maybe this could use the search function.
  # If an Interval is removed, the xmin and xmax values for the IntervalTier containing it should be modified accordingly.
  # Actually, match() is perfect for this.
  # ... except for the fact that it will only return one index and not all indices for each instance of a match.
  # I was thinking about finding the intersection of all indices containing xmin, xmax, text...
  # Use which()
  
  # This function should allow for missing arguments- have it find the most similar Intervals
  # print them out to the user and stop if it finds more than one Interval so that the user
  # can be more specific.
}