#' @name add.Interval
#' @title Add an Interval to a TextGrid
#' @description Adds an Interval to a specified IntervalTier within a TextGrid.
#' 
#' @param textgrid The TextGrid object to modify.
#' @param tier The name of the IntervalTier as a character vector.
#' @param interval The Interval object to be inserted.  Alternatively, this function can initialize a local Interval that is then added to the TextGrid using the arguments described below.
#' @param xmin The beginning time point for the Interval.
#' @param xmax The end time point for the Interval.
#' @param text The annotation for the interval.
#' 
#' @author John Pellman

add.Interval <- function(textgrid, tier, interval=NULL, xmin, xmax, text){
  
}