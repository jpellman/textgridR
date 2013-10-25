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
  # If point is not null, set xmin and xmax to point.
  # If tier is unspecified, iterate through each tier of textgrid.
  # Extract the xmin, xmax, and text values for each tier using sapply and store in vectors.
  # Use which() to retrieve indices where the vectors are equal to xmin, xmax, text.
  # Find the intersection of these indices.
}