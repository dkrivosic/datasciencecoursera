plot3 <- function() {
     NEI <- readRDS("summarySCC_PM25.rds")
     SCC <- readRDS("Source_Classification_Code.rds")
     
     x <- NEI[NEI$fips == "24510", ]
     
     png("plot3.png", height = 480, width = 480)
     g <- ggplot(x, aes(year, Emissions, color = type)) + 
          geom_line(stat = "summary", fun.y = "sum") +
          xlab("year") +
          ylab("Total Emissions in Baltimore City, Maryland")
     print(g)
     dev.off()
     
}