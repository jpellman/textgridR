#' @name annotations
#' @title Extract Annotations 
#' @description Extract annotations into a vector
#' 
#' @param textgrid The TextGrid object to modify.
#' @param tier The name of the IntervalTier as a character vector.
#' @param tr The time step for each index of the vector (in seconds).
#' 
#' @return A character vector containing the text annotations for each time step.
#' 
#' @author John Pellman

annotations <- function(textgrid, tier, tr){
  # Checks to see if 'textgrid' is missing.  Throws error if missing.
  if(missing(textgrid) | is.null(textgrid)){
    stop("Error: No argument for 'textgrid'.")
  }
  # Puts the IntervalTier in an object to manipulate.
  tier <- textgrid[[as.character(tier)]]
  # Extracts all of the tierxmins from the IntervalTier
  tierxmins <- sapply(tier, function(x) x$xmin)
  # Extracts all of the annotations from the IntervalTier
  tiertexts <- sapply(tier, function(x) x$text)
  # Constructs the vector.
  # Look into making this apply-based if possible, or possibly somehow adapting spline?
  texts <- c()
  for (i in 1:length(tierxmins)){
    if (i+1<length(tierxmins)){
      texts <- c(texts, rep(tiertexts[i], (tierxmins[i+1]-tierxmins[i])/tr))
    } else {
      texts <- c(texts, tiertexts[length(tierxmins)])
    }
  }
  texts
}