complete <- function(directory, id = 1:332) {
  arquivos <- list.files(path=directory, pattern="*.csv")
  
  ids <-vector()
  counts = vector()
  
  for(i in id) {
    
    arquivo <- sprintf("%03d.csv", i)
    path <- paste(directory, arquivo, sep="/")
    
    data <- read.csv(path)
    
    ids <- c(ids, i)
    completeCases <- data[complete.cases(data),]
    counts <- c(counts, nrow(completeCases))
  }
  
  ## Return the data frame
  data.frame(id=ids, nobs=counts)
}