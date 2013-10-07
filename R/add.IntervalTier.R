#' @name add.IntervalTier
#' @title Add an IntervalTier to a TextGrid
#' @description Adds an IntervalTier to a TextGrid.  
#' 
#' @param textgrid The TextGrid object to modify.
#' @param tier The IntervalTier object to be inserted.  This can be an IntervalTier object or it can be a vector containing Interval objects (which will then be converted to an IntervalTier internally by this function).
#' 
#' @author John Pellman

add.IntervalTier <- function(textgrid, tier){
  # Makes sure that the there is a TextGrid- throws an error otherwise.
  # Checks to see if 'tier' is a vector or an IntervalTier.  If vector, make new IntervalTier based on the vector.
  # This could be done by initializing a TextGrid and then perhaps using one of the apply functions with add.Interval?
  
}