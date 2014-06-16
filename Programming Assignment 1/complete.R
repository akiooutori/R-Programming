complete <- function(directory, id = 1:332) {
  
  output <- matrix(1, 0, 2)
  
  for(i in id) {
    file <- file.path(directory, sprintf("%03d.csv", i))
    table <- read.csv(file)
    good <- complete.cases(table)
    new <- (c(i, nrow(table[good, ])))
    output <- rbind(output, new)
  }
  
  colnames(output) <- c("id", "nobs")
  rownames(output) <- NULL
  output <- as.data.frame(output)
}