#' @name add.IntervalTier
#' @title Add an IntervalTier to a TextGrid
#' @description Adds an IntervalTier to a TextGrid.  
#' 
#' @param textgrid The TextGrid object to modify.
#' @param name The name of the IntervalTier to be inserted.
#' @param xmin The earliest time point for the intervals contained in the IntervalTier.
#' @param xmax The latest time point for the intervals contained in the IntervalTier.
#' @param intervalmins A vector of beginning values for the Intervals in the IntervalTier.
#' @param intervalmaxs A vector of end values for the Intervals in the IntervalTier.
#' @param intervaltexts  A vector of text annotations for the Intervals in the IntervalTier.
#' 
#' @return The TextGrid with the new IntervalTier added.
#' 
#' @author John Pellman

add.IntervalTier <- function(textgrid, name, xmin, xmax, intervalmins, intervalmaxs, intervaltexts){
  # Makes sure that the there is a TextGrid- throws an error otherwise.
  if(missing(textgrid) | is.null(textgrid)){
    stop("Error: No argument or invalid argument for 'textgrid'.")
  }
  # Coerces other variables into correct types.
  name <- as.character(name)
  xmin <- as.double(xmin)
  xmax <- as.double(xmax)
  intervalmins <- as.double(intervalmins)
  intervalmaxs <- as.double(intervalmaxs)
  intervaltexts <- as.character(intervaltexts)
  # Throws an error if the interval vectors are not the same size or are empty.
  if (!(length(intervalmins)==length(intervalmaxs)==length(intervaltexts)) | length(intervaltexts)==0){
    stop("Error: Vectors specifying beginning values, end values, and text annotations are not the same length or are of length 0.")
  }
  # Fills 'intervals'.
  intervals <- mapply(TextGrid.Interval(xmin, xmax, text),intervalmins,intervalmaxs,intervaltexts, SIMPLIFY=FALSE)
  # Creates the IntervalTier.
  tier <- TextGrid.IntervalTier(name, xmin, xmax, intervals)
  # Adds the IntervalTier to textgrid.
  textgrid[[length(textgrid)+1]] <- tier
  textgrid
}