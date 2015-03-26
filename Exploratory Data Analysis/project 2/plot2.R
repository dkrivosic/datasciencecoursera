plot2 <- function() {
     NEI <- readRDS("summarySCC_PM25.rds")
     SCC <- readRDS("Source_Classification_Code.rds")
     
     x <- aggregate(NEI$Emissions[NEI$fips == "24510"],
                    list(NEI$year[NEI$fips == "24510"]),
                    FUN = "sum")
     
     png("plot2.png", height = 480, width = 480)
     plot(x, type = "l", xlab = "year", ylab = "Emissions in Baltimore City, Maryland")
     dev.off()
}