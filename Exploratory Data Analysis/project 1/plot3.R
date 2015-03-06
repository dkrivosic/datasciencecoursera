plot3 <- function(data) {
     png("plot3.png", height = 480, width = 480)
     
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
            pch = "_")
     
     
     dev.off()
}