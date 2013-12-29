# Using Google style documentation on this object since I am not sure that end users will
# need to declare/initialize any of these manually at the R prompt.  Can convert to roxygen
# later if my mind is changed.

TextGridIntervalTier <- function(name, xmin, xmax, intervals){
  # An object that represents a TextGrid Interval, containing several relevant constants.
  # 
  # Args:
  #   name: A description of the collection of annotations.
  #   xmin: The earliest time point for the intervals contained in the IntervalTier.
  #   xmax: The latest time point for the intervals contained in the IntervalTier.
  #   intervals: A list containing all the Intervals for the IntervalTier.
  # Returns:
  #   An object of class TextGrid.Interval with values name, xmin, xmax, and intervals accessible via the $ operator.

  name <- as.character(name)
  xmin <- as.double(xmin)
  xmax <- as.double(xmax)
  intervals <- as.list(intervals)
  intervaltier <- structure(intervals, class="TextGridIntervalTier", name=name, xmin=xmin, xmax=xmax)
  intervaltier
}