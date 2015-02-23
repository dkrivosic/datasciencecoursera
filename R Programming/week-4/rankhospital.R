rankhospital <- function(state, outcome, num = "best") {
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
     
     hospitals <- data[, 2][states]
     rates <- rates[states]
     
     ranking <- data.frame(hospitals, rates)
     
     if(num[1] == "best") {
          ranking <- ranking[order(ranking[, 2], ranking[, 1]), ]
          num <- 1
     } else if(num[1] == "worst") {
          ranking <- ranking[order(-ranking[, 2], ranking[, 1]), ]
          num <- 1
     } else {
          ranking <- ranking[order(ranking[, 2], ranking[, 1]), ]
     }
     
     as.character(ranking[num, 1])
}