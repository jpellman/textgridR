#' @name modify.Point
#' @title Modifies a time point with certain characteristics in a TextGrid
#' @description Modifies an individual time point from a specified IntervalTier within a TextGrid.
#' 
#' @param textgrid The TextGrid object to modify.
#' @param tier The name of the IntervalTier as a character vector.
#' @param interval The Interval object to be modified.
#' @param point The current time point.
#' @param text The current annotation for the time point.
#' @param newpoint A new time for the time point.
#' @param newtext A new annotation for the time point.
#' 
#' @return A TextGrid object with the modified time point.
#' 
#' @author John Pellman

modify.Point <- function(textgrid, tier, interval=NULL, point, text, newpoint, newtext){
  modify.Interval(textgrid=textgrid, tier=tier, interval=interval, xmin=point, 
                  xmax=point, text=text, newxmin=newpoint, newxmax=newpoint, newtext=newtext)
}