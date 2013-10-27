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
#' @return A TextGrid object with the modified Interval.
#' 
#' @author John Pellman

modify.Interval <- function(textgrid, tier, interval=NULL, xmin, xmax, text, newxmin, newxmax, newtext){
  # Finds the Interval to-be-modified.
  indices <- search.TextGrid(textgrid=textgrid, tier=tier, xmin=xmin, xmax=xmax, point=NULL, text=text)
  #Replaces the Interval's xmin, xmax, and text values.
  textgrid[[indices[1]]][[indices[2]]]$xmin <- newxmin
  textgrid[[indices[1]]][[indices[2]]]$xmax <- newxmax
  textgrid[[indices[1]]][[indices[2]]]$text <- newtext
  # If the new end point is greater than the end point of the IntervalTier, the IntervalTier's xmax value is
  # modified accordingly.
  if (attributes(textgrid[[indices[1]]])$xmax<newxmax){
    attributes(textgrid[[indices[1]]])$xmax <- newxmax
  }
  textgrid
}