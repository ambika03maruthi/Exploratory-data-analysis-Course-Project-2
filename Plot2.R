
setwd("~/Desktop/CE/Data Exploratory Analytics/Week4 Peer graded Assignment/exdata%2Fdata%2FNEI_data")
#read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)

#aggregate total emissions from PM2.5 for Baltimore, Maryland(fips="24510") from 1999-2008.
baltimoreNEI<-NEI[NEI$fips=="24510",]
allBaltimore<-aggregate(Emissions ~ year, baltimoreNEI,sum)

#base plotting system to make a plot of this data, 

barplot(allBaltimore$Emissions,names.arg=allBaltimore$year,xlab="Year", ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From All Baltimore City Sources")

#print the png 
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()