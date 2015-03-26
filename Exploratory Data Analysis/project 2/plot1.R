plot1 <- function() {
     NEI <- readRDS("summarySCC_PM25.rds")
     SCC <- readRDS("Source_Classification_Code.rds")
     
     x <- aggregate(NEI$Emissions, list(NEI$year), FUN = "sum")
     
     png("plot1.png", height = 480, width = 480)
     plot(x, type = "l", xlab = "year", ylab = "Emission")
     dev.off()
}