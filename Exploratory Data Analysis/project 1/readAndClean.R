readAndClean <- function(path) {
     data <- read.csv2(path)
     data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
     data$Time <- as.POSIXct(strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S"))
     
     first <- as.Date("01.02.2007.", format = "%d.%m.%Y")
     second <- as.Date("02.02.2007.", format = "%d.%m.%Y")

     #dplyr package needs to be loaded
     data <- filter(data, data$Date == first | data$Date == second)
     
     for(i in 3:9) {
          data[[i]] <- as.numeric(as.character(data[[i]]))
     }
     
     data
}