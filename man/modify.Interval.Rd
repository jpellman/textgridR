\name{modify.Interval}
\alias{modify.Interval}
\title{Modifies an Interval with certain characteristics in a TextGrid}
\usage{
  modify.Interval(textgrid, tier, interval = NULL, xmin,
    xmax, text, newxmin, newxmax, newtext)
}
\arguments{
  \item{textgrid}{The TextGrid object to modify.}

  \item{tier}{The name of the IntervalTier as a character
  vector.}

  \item{interval}{The Interval object to be modified.}

  \item{xmin}{The current beginning time point for the
  Interval.}

  \item{xmax}{The current end time point for the Interval.}

  \item{text}{The current annotation for the interval.}

  \item{newxmin}{A new beginning time point for the
  Interval.}

  \item{newxmax}{A new end time point for the Interval.}

  \item{newtext}{A new annotation for the interval.}
}
\description{
  Modifies an Interval from a specified IntervalTier within
  a TextGrid.
}
\author{
  John Pellman
}

