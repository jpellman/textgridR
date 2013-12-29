#' @name read.TextGrid
#' @title Read in a TextGrid
#' @description Reads in a Praat TextGrid from a file path / connection and then stores it in an S3 object of class "TextGrid".
#' 
#' @param file A representation of the file.  Can be a file connection or a character vector specifying the path to the TextGrid.  As with read.table, if the path is not absolute, the file name is relative to the current working directory (as determined by getwd()).
#' 
#' @return An S3 object of class "TextGrid", which further contains Intervals and IntervalTiers that can be extracted or manipulated using other functions in this package.
#' @author John Pellman

read.TextGrid <- function(file) {
  # General thoughts on implementing this:
  # The TextGrid object could be a multi-way array.
  # No it can't because the size of the IntervalTiers won't remain constant... maybe a list or table.
  # Maybe get rid of eval(parse()) statements and just use grep for consistency and more sanity.
  # Note: In the future, maybe you are going to need to find a way of implementing this function to work with file types other than "ooTextFile" (although "ooTextFile" files are currently the most important files because I've never really used any other types frankly).

  # Some pseudocode/an outline:
  # Checks to see if file is a file connection; if not coerces into a file connection (possibly give end user a fileEncoding argument too, similar to read.table)
  if (!inherits(file, "connection")) {
    if (is.character(file)){
      file <- file(file, "rt")
      on.exit(close(file))
    } else {
      stop("Invalid argument:  read.TextGrid only accepts file connections or character vectors for argument 'file'.")
    }
  }
  # Makes sure that the file is open.
  if (!isOpen(file, "rt")) {
    open(file, "rt")
    on.exit(close(file))
  }
  # Uses the readLiness function to determine if "File type = "ooTextFile"" is the first line; if not, throws an error, telling the user that this is not a TextGrid.
  if (readLines(file, 1)!='File type = "ooTextFile"'){
    stop("File is not a TextGrid of type 'ooTextFile'.")
  }
  # Uses the readLiness function to determine if "Object class = "TextGrid"" is the second line; if not throws an error, telling the user that this is not a TextGrid and that, while sad, life will go on without all of the TextGriddy goodness.
  if (readLines(file, 2)[1]!='Object class = "TextGrid"'){
    stop("File is not a TextGrid.")
  }
  # Skips one line with readLines. Done implicitly in above if statement.
  # The above could probably be more concisely expressed with one readLiness statement skipping 3 lines, and the lines being assigned to a temp var to check if the file type is right.
  # Have this function parse and evaluate the next two lines to obtain xmin and xmax.  Store in appropriately named variables.  At the end of the function, these variables will be returned in a list.
  xminTextGrid <- unlist(strsplit(readLines(file, 1), " "))
  xminTextGrid <- as.double(xminTextGrid[length(xminTextGrid)])
  xmaxTextGrid <- unlist(strsplit(readLines(file, 1), " "))
  xmaxTextGrid <- as.double(xmaxTextGrid[length(xmaxTextGrid)])
  # Read in the next line.  If tiers do exist, indicate as such in a logical aptly named "tiers"
  if(readLines(file, 1)=='tiers? <exists> '){
    tiers <- TRUE
  } else {
    tiers <- FALSE
  }
  sizeTextGrid <- unlist(strsplit(readLines(file, 1), " "))
  sizeTextGrid <- as.double(sizeTextGrid[length(sizeTextGrid)])
  # Skip over the TextGrid declaration of an array "item" (also perhaps check to see if this declaration did, in fact, occur). Initialize "item" as a list (or perhaps a vector if possible and we want to save RAM; or perhaps a multi-way array).
  if(readLines(file, 1)=='item []: '){
    item <- list()
  } else {
    stop("Error parsing TextGrid array.")
  }
  # While the length of item index is not equal to sizeTextGrid, read in IntervalTiers and store them in the R variable "item".
  while (length(item)!=sizeTextGrid){
    itemIndex <- as.numeric(gsub("[^1234567890]", "", readLines(file, 1))) 
    if (readLines(file, 1)=='        class = "IntervalTier" '){
      tierName <- unlist(strsplit(readLines(file, 1), " "))
      tierName <- as.character(gsub('["]', '', tierName[length(tierName)]))
      tierxmin <- unlist(strsplit(readLines(file, 1), " "))
      tierxmin <- as.double(tierxmin[length(tierxmin)])
      tierxmax <- unlist(strsplit(readLines(file, 1), " "))
      tierxmax <- as.double(tierxmax[length(tierxmax)])
      tierSize <- as.numeric(gsub("[^1234567890]", "", readLines(file, 1)))
      tempTierIntervals <- list()
      for (i in 1:tierSize){
        intervalIndex <- as.numeric(gsub("[^1234567890]", "", readLines(file, 1)))
        intervalxmin <- unlist(strsplit(readLines(file, 1), " "))
        intervalxmin <- as.double(intervalxmin[length(intervalxmin)])
        intervalxmax <- unlist(strsplit(readLines(file, 1), " "))
        intervalxmax <- as.double(intervalxmax[length(intervalxmax)])
        text <- unlist(strsplit(readLines(file, 1), " "))
        text <- as.character(gsub('["]', '', text[length(text)]))
        tempTierIntervals[[intervalIndex]] <- TextGridInterval(intervalxmin, intervalxmax, text)
      }
    } else {
      stop("Error parsing IntervalTiers.")
    }
    item[[itemIndex]] <- TextGridIntervalTier(tierName, tierxmin, tierxmax, tempTierIntervals)
    names(item)[itemIndex] <- tierName
  }
  # To read in an IntervalTier:
    # read in the line :         class = "IntervalTier" ; check to make sure this is correct
    # Create an IntervalTier object. To get the arguments for this object, parse and eval the name, xmin, and xmax labels.
    # Get the length of the IntervalTier object.
    # Iterate through the length of the object, creating Interval objects and adding them to the IntervalTier using add.IntervalTier
    # When the IntervalTier object is done, place it in "item" and repeat the process (i.e., the loop; although it might not be a loop if there is some way to use an apply function instead)
    # Interval objects should be created in in much the same way as IntervalTiers; using parse and eval with readLines (unless I find a better way).
  # When all the IntervalTiers have been read in and added to "item", return a structure of class "TextGrid" that contains xmin, xmax, logical tiers, the size
  textgrid <- structure(item, class="TextGrid", xmin=xminTextGrid, xmax=xmaxTextGrid, tiers=tiers, size=sizeTextGrid)
  textgrid
}