library(ggplot2)
#read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#aggregate total emissions from PM2.5 for Baltimore, Maryland(fips="24510") from 1999-2008.
baltimoreNEI<-NEI[NEI$fips=="24510",]

#plotting
ggplot(baltimoreNEI, aes(factor(year), Emissions, fill=type))+ 
  geom_bar(stat="identity")+
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)"))+
 labs(title=expression("PM"[2.5]*"Emissions, Baltimore City 1999-2008 by Source Type"))+
  facet_grid(.~type,scales = "free",space="free")

#print the png 
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()