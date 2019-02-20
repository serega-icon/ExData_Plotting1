library(chron)
library(stringr)

dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- "household_power_consumption.zip"
extracted_file <- "household_power_consumption.txt"

if (!file.exists(filename)) {
  download.file(dataurl, filename, mode="wb")
}
if (!file.exists(extracted_file)) {
  unzip(filename)
}

setClass("myDate")
setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y"))

dataset <- read.csv(extracted_file, header = TRUE, sep=";", colClasses = c("myDate", rep("character",8)))
dataset <- dataset[dataset$Date >= as.Date("2007-02-01") & dataset$Date <= as.Date("2007-02-02"),]
rm(dataurl, filename, extracted_file)

dataset$Time <- chron(times=dataset$Time)

dataset$Datetime <- strptime(paste(dataset$Date, dataset$Time), "%Y-%m-%d %H:%M:%S")

for (i in 3:9){
  dataset[grepl('.*[^0-9.]+.*', dataset[,i]),i] <- NA
  dataset[,i] <- as.numeric(dataset[,i])
}