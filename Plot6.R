#read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subseting the motor vehicles, i'm assuing tht it's anything like Motor Vehicle in SCC.Level.Two.
vehicles<-grepl("vehicle",SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC<-SCC[vehicles,]$SCC
vehiclesNEI<-NEI[NEI$SCC %in% vehiclesSCC,]

#Comparing emissions from motor vehicle sources in Baltimore City (fips == "24510") 
#with LA (fips == "06037")

vehiclesBaltNEI<-vehiclesNEI[vehiclesNEI$fips == "24510",]
vehiclesBaltNEI$city<-"Baltimore City"
vehiclesLANEI<-vehiclesNEI[vehiclesNEI$fips=="06037",]
vehiclesLANEI$city<-"Los Angeles County"
bothNEI<-rbind(vehiclesBaltNEI,vehiclesLANEI)

#plot 

library(ggplot2)

ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
geom_bar(aes(fill=year),stat="identity") +
facet_grid(scales="free", space="free", .~city) +
guides(fill=FALSE)+theme_bw()+
labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

dev.copy(png,"plot6.png", width=480, height=480)
dev.off()