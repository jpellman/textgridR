#' @name write.TextGrid
#' @title Export a TextGrid
#' @description Exports a TextGrid file to a specified file path.
#' 
#' @param x A TextGrid object.
#' @param file A file connection or a character vector containing the path to where the file should be saved.
#' 
#' @return A logical indicating whether or not the write was successful.
#' @author John Pellman

write.TextGrid <- function(x, file){
  # Okay, here's my 3 AM insomniac pseudocode for this:
  
  # Ensure that x is actually a TextGrid; throw an error otherwise (typecasting would be problematic here).
  
  # Set up a file connection.
  
  # Make an array of strings using the c() function (a character vector in R terminology), 
  # with each slot x representing line x of the TextGrid file.
  
  # The above is quite a bit more complicated than it seems right now, and requires
  # a well-rested brain to fully deliberate what needs to be done (i.e., I need to review
  # the formatting of a TextGrid file before I can proceed).
  
  # Pipe that character vector out to file using writeLines().
  
  # Reminder: write is not an S3 generic.
  
  return(TRUE)
}