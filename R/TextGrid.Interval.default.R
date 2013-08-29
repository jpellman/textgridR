# Using Google style documentation on this object since I am not sure that end users will
# need to declare/initialize any of these manually at the R prompt.  Can convert to roxygen
# later if my mind is changed.

TextGrid.Interval.default <- function(xmin, xmax, text){
  # An object that represents a TextGrid Interval, containing several relevant constants.
  # 
  # Args:
  #   xmin: The beginning time point for the Interval.
  #   xmax: The end time point for the Interval.
  #   text: The annotation for the Interval.
  #
  # Returns:
  #   An object of class TextGrid.Interval with values xmin, xmax, and text accessible via the $ operator.
  
  xmin <- as.double(xmin)
  xmax <- as.double(xmax)
  text <- as.character(text)
  interval <- structure(list(xmin=xmin, xmax=xmax, text=text), class="TextGrid.Interval")
  interval
}