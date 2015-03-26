plot4 <- function() {
     NEI <- readRDS("summarySCC_PM25.rds")
     SCC <- readRDS("Source_Classification_Code.rds")
     
     png(filename = "plot4.png", width = 480, height = 480)
     
     coal <- grep("coal", SCC$Short.Name, ignore.case = T)
     coal <- SCC[coal, ]
     coal <- NEI[NEI$SCC %in% coal$SCC, ]
     
     coalEmissions <- aggregate(coal$Emissions, list(coal$year), FUN = "sum")
     plot(coalEmissions, type = "l", xlab = "year", 
          ylab = "Total Emissions From Coal Combustion-related Sources")
     
     dev.off()
}