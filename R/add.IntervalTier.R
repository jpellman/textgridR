#' @name add.IntervalTier
#' @title Add an IntervalTier to a TextGrid
#' @description Adds an IntervalTier to a TextGrid.  
#' 
#' @param textgrid The TextGrid object to modify.
#' @param tier The IntervalTier object to be inserted.  This can be an IntervalTier object or it can be a vector containing Interval objects (which will then be converted to an IntervalTier internally by this function).
#' @param name A name for the IntervalTier if 'tier' is a vector of Intervals and not an IntervalTier object.
#'  
#' @author John Pellman

add.IntervalTier <- function(textgrid, tier, name){
  # Makes sure that the there is a TextGrid- throws an error otherwise.
  if(missing(textgrid) | is.null(textgrid)){
    stop("Error: No argument for 'textgrid'.")
  }
  # Checks to see if 'tier' is a vector or an IntervalTier.  If vector, make new IntervalTier based on the vector.
  if (is.vector(tier) && class(tier)=="TextGrid.Interval"){
    # Determines xmin and xmax values for TextGrid.IntervalTier
    tierxmins <- as.table(sapply(tier, function(x) x$xmin))
    tierxmaxs <- as.table(sapply(tier, function(x) x$xmax))
    tierxmins <- sort(tierxmins)
    tierxmaxs <- sort(tierxmaxs)
    # Declares and instatiates an instance of an IntervalTier
    # 'tier' will be coerced to a list internally by TextGrid.IntervalTier.
    tier <- TextGrid.IntervalTier(name, tierxmins[1], tierxmaxs[length(tierxmaxs)], tier)
  } else if (!(class(tier)=="IntervalTier"){
    stop("Error: 'interval' is not an IntervalTier or a vector containing Intervals.")
  }
}