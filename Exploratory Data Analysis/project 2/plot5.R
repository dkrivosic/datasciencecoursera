plot5 <- function() {
     NEI <- readRDS("summarySCC_PM25.rds")
     SCC <- readRDS("Source_Classification_Code.rds")
     
     x <- NEI[NEI$fips == "24510", ] 
     
     png("plot5.png", width = 480, height = 480)
     
     motor <- grep("motor", SCC$Short.Name, ignore.case = T)
     motor <- SCC[motor, ]
     motor <- x[x$SCC %in% motor$SCC, ]
     
     motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")
     
     plot(motorEmissions, type = "l", xlab = "year", 
          ylab = "Emissions From Motor Vehicle Sources in Baltimore City, Maryland")
     
     dev.off()
}