## Get full dataset
data <- read.table(file="household_power_consumption.txt", header = T, sep = ';',
                   na.strings = "?")
## Subset data by required date
data1 <- subset(data, subset = (Date == "1/2/2007" | Date == "2/2/2007"))
## Combine date and time into datetime
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")
datetime <- paste(data1$Date, data1$Time)
data1$Datetime <- as.POSIXct(datetime)
## Plot photo1 and save it to png file
hist(as.numeric(data1$Global_active_power), col = "red", main = ("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png",height=480, width=480)
dev.off()