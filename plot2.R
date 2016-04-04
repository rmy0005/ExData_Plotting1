# Read the Household Power Consumption Data between 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# filter data by Date 2007-02-01, 2007-02-02
filterdata <- subset(data[data$Date %in% c("1/2/2007","2/2/2007") ,])

datetime <- paste(filterdata$Date, filterdata$Time, sep=" ")

day <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

# set the device to png
png("plot2.png", width=480, height=480)

plot(day, as.numeric(filterdata$Global_active_power), type="l", xlab="",ylab="Global Active Power (kilowatts)")

dev.off()