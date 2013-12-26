\name{add.Interval}
\alias{add.Interval}
\title{Add an Interval to a TextGrid}
\usage{
  add.Interval(textgrid, tier, xmin, xmax, text)
}
\arguments{
  \item{textgrid}{The TextGrid object to modify.}

  \item{tier}{The name of the IntervalTier as a character
  vector.}

  \item{xmin}{The beginning time point for the Interval to
  be inserted.}

  \item{xmax}{The end time point for the Interval to be
  inserted.}

  \item{text}{The annotation for the Interval to be
  inserted.}
}
\value{
  A TextGrid object with the Interval added.
}
\description{
  Adds an Interval to a specified IntervalTier within a
  TextGrid.
}
\author{
  John Pellman
}

