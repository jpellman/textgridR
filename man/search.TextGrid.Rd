\name{search.TextGrid}
\alias{search.TextGrid}
\title{Search a TextGrid for an Interval}
\usage{
  search.TextGrid(textgrid, tier, xmin, xmax, point = NULL,
    text)
}
\arguments{
  \item{textgrid}{The TextGrid object to search.}

  \item{tier}{If it is known, you can specify the name of
  the tier that contains the Interval as a character
  vector.}

  \item{xmin}{The beginning time point for the Interval,
  rounded to a whole integer.}

  \item{xmax}{The end time point for the Interval, rounded
  to a whole integer.}

  \item{point}{A time point if the Interval is an
  individual time point.}

  \item{text}{The annotation for the Interval.}
}
\value{
  A two element vector containing the indices for the first
  Interval object matching the arguments and its
  IntervalTier.
}
\description{
  Searches a TextGrid for a specific Interval.
}
\author{
  John Pellman
}

