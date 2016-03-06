## Get full dataset
data <- read.table(file="household_power_consumption.txt", header = T, sep = ';',
                   na.strings = "?")
## Subset data by required date
data1 <- subset(data, subset = (Date == "1/2/2007" | Date == "2/2/2007"))
## Combine date and time into datetime
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")
datetime <- paste(data1$Date, data1$Time)
data1$Datetime <- as.POSIXct(datetime)
## Plot photo4 and save it to file
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data1, {
  plot(Global_active_power ~ Datetime, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
  legend("top", cex=.65, col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n", pt.cex = 1,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ Datetime, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})
dev.copy(png, file="plot4.png",height=480, width=480)
dev.off()