plot4 <- function(data) {
     png("plot4.png", height = 480, width = 480)
     par(mfrow = c(2, 2))
     
     #top left
     plot(Global_active_power ~ Time,
          data,
          type = "s",
          ylab = "Global active power",
          xlab = "")
     
     #top right
     plot(Voltage ~ Time,
          data,
          type = "s",
          ylab = "Voltage",
          xlab = "datetime")
     
     #bottom left
     plot(data$Time,
          data$Sub_metering_1,
          type = "n",
          ylab = "Energy sub metering",
          xlab = "")
     
     with(data, points(Time, Sub_metering_1, type = "s", col = "black"))
     with(data, points(Time, Sub_metering_2, type = "s", col = "red"))
     with(data, points(Time, Sub_metering_3, type = "s", col = "blue"))
     
     legend("topright",
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            col = c("black", "red", "blue"),
            pch = "_",
            bty = "n")
     
     #bottom right
     plot(Global_reactive_power ~ Time,
          data,
          type = "s",
          ylab = "Global_reactive_power",
          xlab = "datetime")

     
     dev.off()
}