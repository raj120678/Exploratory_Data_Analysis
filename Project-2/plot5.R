
# Question 5:
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Set working directory and clear all variables
setwd("D:/SME/Exploratory Data Analysis/Week 3/Assignment/")
rm(list = ls(all = TRUE))

# Load ggplot2 library
library(ggplot2)
library(plyr)

# Read the data file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Assume "Motor Vehicles" only means on road
BaltimoreCityMV <- subset(NEI, fips == "24510" & type=="ON-ROAD")

BaltimoreMVPM25ByYear <- ddply(BaltimoreCityMV, .(year), function(x) sum(x$Emissions))
colnames(BaltimoreMVPM25ByYear)[2] <- "Emissions"

png("plot5.png")
qplot(year, Emissions, data=BaltimoreMVPM25ByYear, geom="line") +
  ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
  xlab("Year") +
  ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)")) +
  geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))
dev.off()