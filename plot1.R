
#setwd("<set the path>")

# this script assume the coorect working directory is set and 
# data set is downloaded in stored in the data (sub) folder where the r script is

dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# get the subset of the data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(subSetData$Global_active_power)

#device for plot
png("plot1.png", width=480, height=480)

# Check the data
#head(globalActivePower)


# draw the hist
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Close te graphics device
dev.off()