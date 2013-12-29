# Generic functions shouldn't really need any extra documentation.

print.TextGrid <- function(x){
  summary(x)
  cat("\n")
  for (i in 1:length(x)){
    print(x[[i]])
    cat("\n")
  }
}