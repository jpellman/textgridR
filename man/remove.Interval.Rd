\name{remove.Interval}
\alias{remove.Interval}
\title{Remove an Interval with certain characteristics from a TextGrid}
\usage{
  remove.Interval(textgrid, tier, xmin, xmax, text)
}
\arguments{
  \item{textgrid}{The TextGrid object to modify.}

  \item{tier}{The name of the IntervalTier as a character
  vector.}

  \item{xmin}{The beginning time point for the Interval.}

  \item{xmax}{The end time point for the Interval.}

  \item{text}{The annotation for the interval.}
}
\value{
  A TextGrid object with the Interval removed.
}
\description{
  Removes an Interval from a specified IntervalTier within
  a TextGrid.
}
\author{
  John Pellman
}

