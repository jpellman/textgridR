#' @name remove.Point
#' @title Removes a time point from a TextGrid
#' @description Removes a single time point from a specified IntervalTier within a TextGrid.
#' 
#' @param textgrid The TextGrid object to modify.
#' @param tier The name of the IntervalTier as a character vector.
#' @param point The time point to be removed.
#' @param text The annotation for the point.
#' 
#' @author John Pellman

remove.Point <- function(textgrid, tier, point, text){
  remove.Interval(textgrid=textgrid, tier=tier, xmin=point, xmax=point, text=text)  
}
