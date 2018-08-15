setwd("~/Desktop/CE/Data Exploratory Analytics/Week4 Peer graded Assignment/exdata%2Fdata%2FNEI_data")
library(dplyr)

#read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#"aggregate" the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
aggregateTotals<-aggregate(Emissions ~ year,NEI, sum)

#bar graph
barplot((aggregateTotals$Emissions)/10^6, names.arg=aggregateTotals$year, xlab="Year",
ylab="PM2.5 Emissions (10^6 Tons)", main="Total PM2.5 Emissions From All US Sources")

#saving the png
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

