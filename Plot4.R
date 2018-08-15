#read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset  coal combustion-related data from bith SCC & NEI
combRelated<-grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated<-grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalComb<-(combRelated & coalRelated)
combSCC<-SCC[coalComb,]$SCC
combustionNEI<-NEI[NEI$SCC %in% combSCC,]

#SCC.Level.One contains the substring 'comb' and SCC.Level.Four contains the substring 'coal'.

library(ggplot2)

ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
geom_bar(stat="identity",fill="Pink",width=0.65)+ guides(fill=FALSE) +
labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

#print the png
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()