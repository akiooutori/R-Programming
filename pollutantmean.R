pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  means <- vector(mode="numeric", length=0)
  
  for(i in id) {
    file <- file.path(directory, sprintf("%03d.csv", i))
    table <- read.csv(file)
    means <- c(means, table[[pollutant]])
  }
  mean(means, na.rm = TRUE)
}