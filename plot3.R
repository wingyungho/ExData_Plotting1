data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

time <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

gap <- as.numeric(subset$Global_active_power)

meter1 <- as.numeric(subset$Sub_metering_1)

meter2 <- as.numeric(subset$Sub_metering_2)

meter3 <- as.numeric(subset$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(time, meter1, type="l", ylab="Energy sub metering", xlab="")

lines(time, meter2, type="l", col="red")

lines(time, meter3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()



