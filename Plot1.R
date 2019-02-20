#Plot1.R
source("plot_load_dataset.R")

png("Plot1.png", width=480, height=480)
hist(dataset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()