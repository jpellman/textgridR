\name{read.TextGrid}
\alias{read.TextGrid}
\title{Read in a TextGrid}
\usage{
  read.TextGrid(file)
}
\arguments{
  \item{file}{A representation of the file.  Can be a file
  connection or a character vector specifying the path to
  the TextGrid.  As with read.table, if the path is not
  absolute, the file name is relative to the current
  working directory (as determined by getwd()).}
}
\value{
  An S3 object of class "TextGrid", which further contains
  Intervals and IntervalTiers that can be extracted or
  manipulated using other functions in this package.
}
\description{
  Reads in a Praat TextGrid from a file path / connection
  and then stores it in an S3 object of class "TextGrid".
}
\author{
  John Pellman
}

