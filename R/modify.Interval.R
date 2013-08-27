#' @name modify.Interval
#' @title Modifies an Interval with certain characteristics in a TextGrid
#' @description Modifies an Interval from a specified IntervalTier within a TextGrid.
#' 
#' @param textgrid The TextGrid object to modify.
#' @param tier The name of the IntervalTier as a character vector.
#' @param interval The Interval object to be modified.
#' @param xmin The current beginning time point for the Interval.
#' @param xmax The current end time point for the Interval.
#' @param text The current annotation for the interval.
#' @param newxmin A new beginning time point for the Interval.
#' @param newxmax A new end time point for the Interval.
#' @param newtext A new annotation for the interval.
#' 
#' @author John Pellman

modify.Interval <- function(textgrid, tier, interval=NULL, xmin, xmax, text, newxmin, newxmax, newtext){
  # Maybe this could use the search function.
}