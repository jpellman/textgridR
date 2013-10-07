#' @name search.TextGrid
#' @title Search a TextGrid for an Interval
#' @description Searches a TextGrid for a specific Interval.
#' 
#' @param textgrid The TextGrid object to search.
#' @param tier If it is known, you can specify the name of the tier that contains the Interval.
#' @param xmin The beginning time point for the Interval.
#' @param xmax The end time point for the Interval.
#' @param point A time point if the Interval is an individual time point.
#' @param text The annotation for the Interval.
#' 
#' @return The index for the Interval object matching the arguments.
#' 
#' @author John Pellman

search.TextGrid <- function(textgrid, tier, xmin, xmax, point=NULL, text){
  # Use match() perhaps.
}