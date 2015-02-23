best <- function(state, outcome) {
     data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
     
     rates <- numeric(0)
     
     if(outcome[1] == "heart attack") {
          rates <- as.numeric(data[, 11])
     } else if(outcome[1] == "heart failure") {
          rates <- as.numeric(data[, 17])
     } else if(outcome[1] == "pneumonia") {
          rates <- as.numeric(data[, 23])
     } else {
          stop("invalid outcome")
     }
     
     states <- data[, 7] == state
     if(sum(states) == 0) {
          stop("invalid state")
     }
     
     rates <- rates[states]
     hospitals <- data[, 2][states]
     
     min <- rates[1]
     bestHospitals <- c(hospitals[1])
     
     n <- length(rates)
     
     for(i in 1:n) {
          if(is.na(rates[i])) next
          
          if(rates[i] < min[1]) {
               min <- rates[i]
               bestHispitals <- c(hospitals[i])
          } else if(rates[i] == min[1]) {
               bestHospitals <- c(bestHospitals, hospitals[i])
          }
     }
     
     bestHospitals <- sort(bestHispitals)
     bestHospitals[1]
}