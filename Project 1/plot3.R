setwd("D:/SME/Exploratory Data Analysis/Week 1/Assignment/")
rm(list = ls(all = TRUE))
HHPC <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";" , stringsAsFactors=FALSE, dec=".")
HHPC_Subset <- HHPC[HHPC$Date %in% c("1/2/2007","2/2/2007") ,]

HHPCdatetime <- strptime(paste(HHPC_Subset$Date, HHPC_Subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(HHPC_Subset$Global_active_power)

SubMetering1 <- as.numeric(HHPC_Subset$Sub_metering_1)
SubMetering2 <- as.numeric(HHPC_Subset$Sub_metering_2)
SubMetering3 <- as.numeric(HHPC_Subset$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(HHPCdatetime, SubMetering1, type="l", ylab="Energy SubMetering", xlab="")
lines(HHPCdatetime, SubMetering2, type="l", col="red")
lines(HHPCdatetime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
