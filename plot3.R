# Read the Household Power Consumption Data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# filter data by Date 2007-02-01, 2007-02-02
filterdata <- subset(data[data$Date %in% c("1/2/2007","2/2/2007") ,])

datetime <- paste(filterdata$Date, filterdata$Time, sep=" ")

day <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

# set the device to png
png("plot3.png", width=480, height=480)

plot(day, as.numeric(filterdata$Sub_metering_1), type="l", xlab="",ylab="Energy sub metering")
lines(day, as.numeric(filterdata$Sub_metering_2, type="l", col="red"))
lines(day, as.numeric(filterdata$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()