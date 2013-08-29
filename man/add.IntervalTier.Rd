\name{add.IntervalTier}
\alias{add.IntervalTier}
\title{Add an IntervalTier to a TextGrid}
\usage{
  add.IntervalTier(textgrid, tier)
}
\arguments{
  \item{textgrid}{The TextGrid object to modify.}

  \item{tier}{The IntervalTier object to be inserted.  This
  can be an IntervalTier object or it can be a vector
  containing Interval objects (which will then be converted
  to an IntervalTier internally by this function).}
}
\description{
  Adds an IntervalTier to a TextGrid.
}
\author{
  John Pellman
}

