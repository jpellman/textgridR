#' @name add.Interval
#' @title Add an Interval to a TextGrid
#' @description Adds an Interval to a specified IntervalTier within a TextGrid.
#' 
#' @param textgrid The TextGrid object to modify.
#' @param tier The name of the IntervalTier as a character vector.
#' @param xmin The beginning time point for the Interval to be inserted.
#' @param xmax The end time point for the Interval to be inserted.
#' @param text The annotation for the Interval to be inserted.
#' 
#' @author John Pellman

add.Interval <- function(textgrid, tier, xmin, xmax, text){
  # Checks to see if 'textgrid' is missing.  Throws error if missing.
  if(missing(textgrid) | is.null(textgrid)){
    stop("Error: No argument for 'textgrid'.")
  }
  # Prepares the IntervalTier.
  tier <- as.character(tier)
  tier <- textgrid[[tier]]
  if (is.null(tier)) stop("Error: IntervalTier is null.  Perhaps 'tier' was mistyped.")
  # Extracts all of the tierxmins from the IntervalTier
  # Coerces them to a table to ensure that there indices are labelled.
  tierxmins <- as.table(sapply(tier, function(x) x$xmin))
  # Prepares the Interval object.
  interval <- TextGrid.Interval(xmin, xmax, text)
  # Adds the xmin value of the new Interval to tierxmins
  tierxmin[length(tierxmins)+1] <- xmin
  # Gives names to the xmin values, with "MARK" for the new xmin value.
  names(tierxmins) <- c(1:(length(tierxmins)-1), "MARK")
  # Sorts the xmin values
  tierxmins <- sort(tierxmins)
  # Gets the new index for the value of xmin to be inserted.
  addIndex <- which(names(tierxmins)=="MARK")
  # Re-create the IntervalTier accordingly.
  secondhalf <-tier[[addIndex:length(tier)]]
  tier[[addIndex]] <- interval
  tier[[(addIndex+1):(length(tier+1))]] <- secondhalf
  tier
}