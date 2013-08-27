#' @name remove.Interval
#' @title Remove an Interval with certain characteristics from a TextGrid
#' @description Removes an Interval from a specified IntervalTier within a TextGrid.
#' 
#' @param textgrid The TextGrid object to modify.
#' @param tier The name of the IntervalTier as a character vector.
#' @param interval The Interval object to be removed.
#' @param xmin The beginning time point for the Interval.
#' @param xmax The end time point for the Interval.
#' @param text The annotation for the interval.
#' 
#' @author John Pellman

remove.Interval <- function(textgrid, tier, interval=NULL, xmin, xmax, text){
  # Maybe this could use the search function.
  # If an Interval is removed, the xmin and xmax values for the IntervalTier containing it should be modified accordingly.
}