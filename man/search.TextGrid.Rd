\name{search.TextGrid}
\alias{search.TextGrid}
\title{Search a TextGrid for an Interval}
\usage{
  search.TextGrid(textgrid, tier, xmin, xmax, point, text)
}
\arguments{
  \item{textgrid}{The TextGrid object to search.}

  \item{tier}{If it is known, you can specify the name of
  the tier that contains the Interval.}

  \item{xmin}{The beginning time point for the Interval.}

  \item{xmax}{The end time point for the Interval.}

  \item{point}{A time point if the Interval is an
  individual time point.}

  \item{text}{The annotation for the Interval.}
}
\value{
  The index for the Interval object matching the arguments.
}
\description{
  Searches a TextGrid for a specific Interval.
}
\author{
  John Pellman
}

