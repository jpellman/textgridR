#' @name modify.IntervalTier
#' @title Change the name of an IntervalTier in a TextGrid
#' @description Changes the name of an IntervalTier in a TextGrid.
#' @param textgrid The TextGrid object to modify.
#' @param oldname The current name of the IntervalTier.
#' @param newname The new name for the IntervalTier.
#' 
#' @return A TextGrid object with the modified IntervalTier.
#' 
#' @author John Pellman

modify.IntervalTier <- function(textgrid, oldname, newname){
  # Checks to see if 'textgrid' is missing.  Throws error if missing.
  if(missing(textgrid) | is.null(textgrid)){
    stop("Error: No argument for 'textgrid'.")
  }
  # Coerces variables to proper types.
  oldname <- as.character(oldname)
  newname <- as.character(newname)
  # Replaces oldname with newname.  First changes value of the textgrid list's name.
  # Then changes the internal attribute of the IntervalTier object.
  names(textgrid)[which(names(textgrid)==oldname)] <- newname
  attributes(textgrid[[which(names(textgrid)==oldname)]]) <- newname
  textgrid
}