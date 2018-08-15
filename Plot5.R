#read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subseting the motor vehicles, i'm assuing tht it's anything like Motor Vehicle in SCC.Level.Two.
vehicles<-grepl("vehicle",SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC<-SCC[vehicles,]$SCC
vehiclesNEI<-NEI[NEI$SCC %in% vehiclesSCC,]

#subseting motor vehicles in Baltimore

baltimoreVehiclesNEI<-vehiclesNEI[vehiclesNEI$fips==24510,]
library(ggplot2)

#plot
ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
geom_bar(stat="identity",fill="Orange",width=0.65) +guides(fill=FALSE) +
labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))
 
#Save png
dev.copy(png,"plot5.png", width=480, height=480)
dev.off()