pollutantmean <- function(directory, pollutant, id = 1:332) {
     files <- list.files(directory)[id]
     values <- numeric()
     for(file in files) {
          data <- read.csv(paste(directory, file, sep = "/"))
          values <- c(values, data[[pollutant]])
     }
     
     values <- values[!is.na(values)]
     mean(values)
}