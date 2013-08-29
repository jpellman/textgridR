\name{add.Interval}
\alias{add.Interval}
\title{Add an Interval to a TextGrid}
\usage{
  add.Interval(textgrid, tier, interval = NULL, xmin, xmax,
    text)
}
\arguments{
  \item{textgrid}{The TextGrid object to modify.}

  \item{tier}{The name of the IntervalTier as a character
  vector.}

  \item{interval}{The Interval object to be inserted.
  Alternatively, this function can initialize a local
  Interval that is then added to the TextGrid using the
  arguments described below.}

  \item{xmin}{The beginning time point for the Interval.}

  \item{xmax}{The end time point for the Interval.}

  \item{text}{The annotation for the interval.}
}
\description{
  Adds an Interval to a specified IntervalTier within a
  TextGrid.
}
\author{
  John Pellman
}

