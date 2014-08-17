pollutantmean <- function(directory, pollutant, id = 1:332) {
 
  arquivos <- list.files(path=directory, pattern="*.csv")
  
  valores <- vector()
  
  
  for(i in id) {
    arquivo = sprintf("%03d.csv", i)
    path <- paste(directory, arquivo, sep="/")
    informacoes <- read.csv(path) 
    
    d <- informacoes[, pollutant]
    d <- d[!is.na(d)]
    
    valores <- c(valores, d)
    
  }
  
  round(mean(valores), 3)
  
}