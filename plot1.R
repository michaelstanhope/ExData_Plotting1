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

png(file = "plot1.png", bg = "transparent")

hist(data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red")

dev.off()