# Before execution, 
# unzip the household_power_consumption.zip into the workig directory

rawData <- read.table("household_power_consumption.txt", 
                      header = TRUE, 
                      sep = ";", 
                      stringsAsFactors = FALSE,
                      colClasses = c(rep("character",2),rep("numeric",7)),
                      na.strings = "?"
)
rawData$Time <- strptime(paste(rawData$Date, rawData$Time), "%d/%m/%Y %T")
rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")

data <- subset(rawData, Date == "2007-02-01" | Date == "2007-02-02")

png(file = "plot3.png", bg = "transparent")

plot(data$Time, data$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")

points(data$Time, data$Sub_metering_2, type = "l", col = "red")
points(data$Time, data$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty=c(1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

