rankall <- function(outcome, num = "best") {
     data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
 
     col <- 0
     
     if(outcome == "heart attack") {
          col <- 11
     } else if(outcome == "heart failure") {
          col <- 17
     } else if(outcome == "pneumonia") {
          col <- 23
     } else {
          stop("invalid outcome")
     }
     
     list <- split(data, data$State)
     n <- length(list)
     hospital <- character(n)
     state <- character(n)
     
     for(i in 1:n) {
          df <- as.data.frame(list[i])
          if(num == "best") {
               df <- df[order(as.numeric(df[, col]), df[, 2]), ]
               br <- 1
          } else if(num == "worst") {
               df <- df[order(-as.numeric(df[, col]), df[, 2]), ]
               br <- 1
          } else {
               df <- df[order(as.numeric(df[, col]), df[, 2]), ]
               br <- num
          }
          
          hospital[i] <- df[br, 2]
          state[i] <- df[br, 7]
     }
     
     data.frame(hospital, state)
}