\name{add.IntervalTier}
\alias{add.IntervalTier}
\title{Add an IntervalTier to a TextGrid}
\usage{
  add.IntervalTier(textgrid, name, xmin, xmax,
    intervalmins, intervalmaxs, intervaltexts)
}
\arguments{
  \item{textgrid}{The TextGrid object to modify.}

  \item{name}{The name of the IntervalTier to be inserted.}

  \item{xmin}{The earliest time point for the intervals
  contained in the IntervalTier.}

  \item{xmax}{The latest time point for the intervals
  contained in the IntervalTier.}

  \item{intervalmins}{A vector of beginning values for the
  Intervals in the IntervalTier.}

  \item{intervalmaxs}{A vector of end values for the
  Intervals in the IntervalTier.}

  \item{intervaltexts}{A vector of text annotations for the
  Intervals in the IntervalTier.}
}
\value{
  The TextGrid with the new IntervalTier added.
}
\description{
  Adds an IntervalTier to a TextGrid.
}
\author{
  John Pellman
}

