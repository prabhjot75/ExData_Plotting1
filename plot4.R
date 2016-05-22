# this script assume the coorect working directory is set and 
# data set is downloaded in stored in the data (sub) folder where the r script is

dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


# get the requried set of the data
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

#device for plot
png("plot4.png", width=480, height=480)

#define the layout in 2 rows and 2 cols
par(mfrow = c(2, 2)) 

#plot the data
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#plot the voltage
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#plot submetering(s) ...

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

#attached the legends
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# plot the golablReactive power
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#close the device
dev.off()