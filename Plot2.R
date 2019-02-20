#Plot2.R
source("plot_load_dataset.R")

png("Plot2.png", width=480, height=480)
plot(dataset$Datetime, dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()