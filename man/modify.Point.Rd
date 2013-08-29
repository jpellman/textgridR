\name{modify.Point}
\alias{modify.Point}
\title{Modifies a time point with certain characteristics in a TextGrid}
\usage{
  modify.Point(textgrid, tier, interval = NULL, point,
    text, newpoint, newtext)
}
\arguments{
  \item{textgrid}{The TextGrid object to modify.}

  \item{tier}{The name of the IntervalTier as a character
  vector.}

  \item{interval}{The Interval object to be modified.}

  \item{point}{The current time point.}

  \item{text}{The current annotation for the time point.}

  \item{newpoint}{A new time for the time point.}

  \item{newtext}{A new annotation for the time point.}
}
\description{
  Modifies an individual time point from a specified
  IntervalTier within a TextGrid.
}
\author{
  John Pellman
}

