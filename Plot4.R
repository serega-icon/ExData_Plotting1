#Plot4.R
source("plot_load_dataset.R")

png("Plot4.png", width=480, height=480)
par(mfrow=c(2, 2))
plot(dataset$Datetime, dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dataset$Datetime, dataset$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dataset$Datetime, dataset$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dataset$Datetime, dataset$Sub_metering_2, type="l", col="red")
lines(dataset$Datetime, dataset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(dataset$Datetime, dataset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()