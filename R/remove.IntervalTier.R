#' @name remove.IntervalTier
#' @title Remove an IntervalTier from a TextGrid
#' @description Removes an IntervalTier from a TextGrid.
#' @param textgrid The TextGrid object to modify.
#' @param tier A character vector containing the name of the IntervalTier to be removed.
#' @return The TextGrid minus the specified IntervalTier to be removed.
#' 
#' @author John Pellman

remove.IntervalTier <- function(textgrid, tier){
  # Makes sure that the there is a TextGrid- throws an error otherwise.
  if(missing(textgrid) | is.null(textgrid)){
    stop("Error: No argument or invalid argument for 'textgrid'.")
  }
  # Casts 'tier' as a character vector.
  tier <- as.character(tier)
  # Throw an error if the name does not refer to an indexed IntervalTier.
  if (is.null(textgrid[[tier]])) stop("Error: IntervalTier name not found.  Perhaps 'tier' was mistyped?")
 # Removes the specified IntervalTier.
  textgrid <- textgrid[[which(names(textgrid)!=tier]]
  # Updates the size of the TextGrid.
  attributes(textgrid)$size <- attributes(textgrid)$size - 1
  textgrid
}