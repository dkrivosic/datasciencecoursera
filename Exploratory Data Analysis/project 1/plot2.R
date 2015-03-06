plot2 <- function(data) {
     png("plot2.png", height = 480, width = 480)
     
     plot(Global_active_power ~ Time,
          data,
          type = "s",
          ylab = "Global active power (kilowatts)",
          xlab = "")
     
     dev.off()
}