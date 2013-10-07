#' @name add.Point
#' @title Add a time point to a TextGrid
#' @description Adds a single time point to a specified IntervalTier within a TextGrid.
#' 
#' @param textgrid The TextGrid object to modify.
#' @param tier The name of the IntervalTier as a character vector.
#' @param point The time point to be added.
#' @param text The annotation for the point.
#' 
#' @author John Pellman

add.Point <- function(textgrid, tier, point, text){
  add.Interval(textgrid=textgrid, tier=tier, xmin=point, xmax=point, text=text)  
}

