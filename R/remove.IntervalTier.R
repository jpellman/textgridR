#' @name remove.IntervalTier
#' @title Remove an IntervalTier from a TextGrid
#' @description Removes an IntervalTier from a TextGrid.
#' @param textgrid The TextGrid object to modify.
#' @param tier A character vector containing the name of the IntervalTier to be removed.
#' 
#' @author John Pellman

remove.IntervalTier <- function(textgrid, tier){
 
  attributes(textgrid)$size <- attributes(textgrid)$size - 1
}