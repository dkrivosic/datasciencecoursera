complete <- function(directory, id = 1:332) {
     files <- list.files(directory)[id]
     n  <- length(id)
     result <- data.frame(id = integer(n), nobs = integer(n))
     
     for(i in 1:n) {
          if(is.na(files[i])) {
               break
          }
          data <- read.csv(paste(directory, files[i], sep = "/"))
          sulfateComplete <- !is.na(data$sulfate)
          nitrateComplete <- !is.na(data$nitrate)
          complete <- sulfateComplete & nitrateComplete
          result$id[i] <- id[i]
          result$nobs[i] <- sum(complete)
     }
     
     result
}