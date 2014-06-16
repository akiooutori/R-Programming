corr <- function(directory, threshold = 0) {
  
  cases <- complete(directory)
  thold_cases <- cases[cases$nobs > threshold, ]
  
  vec <- vector(mode = "numeric", length = 0)
  
  for(i in thold_cases$id) {
    file <- file.path(directory, sprintf("%03d.csv", i))
    table <- read.csv(file)
    good <- complete.cases(table)
    vec <- c(vec, (cor(table[good, ]$nitrate, table[good, ]$sulfate)))
  }
  print(vec)
}