plot6 <- function() {
     NEI <- readRDS("summarySCC_PM25.rds")
     SCC <- readRDS("Source_Classification_Code.rds")
     
     x <- NEI[NEI$fips == "24510"|NEI$fips == "06037", ]
     
     png("plot61.png", width = 480, height = 480)
     
     motor <- grep("motor", SCC$Short.Name, ignore.case = T)
     motor <- SCC[motor, ]
     motor <- x[x$SCC %in% motor$SCC, ]
     
     g <- ggplot(motor, aes(year, Emissions, color = fips))
     g <- g + geom_line(stat = "summary", fun.y = "sum") +
          xlab("year") +
          ylab("Total Emissions From Motor Vehicle Sources") +
          scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))
     print(g)
     
     dev.off()
}