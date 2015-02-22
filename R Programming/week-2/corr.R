corr <- function(directory, treshold = 0) {
     complete <- complete(directory)
     id <- complete$id[complete$nobs > treshold]
     files <- list.files(directory)
     n <- length(id)
     
     correlation <- numeric(n)
     
     for(i in 1:n) {
          if(is.na(files[id[i]])) {
               break
          }
          data <- read.csv(paste(directory, files[id[i]], sep = "/"))
          correlation[i] <- cor(data$sulfate, data$nitrate, use = "complete")
     }
     correlation
}