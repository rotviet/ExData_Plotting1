## Get full dataset
data <- read.table(file="household_power_consumption.txt", header = T, sep = ';',
                   na.strings = "?")
## Subset data by required date
data1 <- subset(data, subset = (Date == "1/2/2007" | Date == "2/2/2007"))
## Combine date and time into datetime
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")
datetime <- paste(data1$Date, data1$Time)
data1$Datetime <- as.POSIXct(datetime)
## Plot photo3 and save it to file
with(data1, { plot(Sub_metering_1 ~ Datetime, type = "l", 
                   xlab=" ", ylab = "Global Active Power (kilowatts)")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 3, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png",height=480, width=480)
dev.off()