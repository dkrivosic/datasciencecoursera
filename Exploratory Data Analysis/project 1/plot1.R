plot1 <- function(data) {
     png("plot1.png", height = 480, width = 480)

     hist(data$Global_active_power,
          col = "red",
          main = "Global active power",
          xlab = "Global active power (kilowatts)")
     
     dev.off()
}