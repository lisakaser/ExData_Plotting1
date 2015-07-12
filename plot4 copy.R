## Exploratory Data Analysis:
## Course Project 1
## plot 1


## clean workspace
rm(list=ls()) #remove all variables
dev.off() #close plot

## change directory

setwd("/Users/kaser/Documents/coursera/DataScience/1_TheDataScientistsToolbox/GitHub/ExploratoryDataAnalysis/Assignement1")

## download file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "/Users/kaser/Documents/coursera/DataScience/1_TheDataScientistsToolbox/GitHub/ExploratoryDataAnalysis/Assignement1/household_power_consumption.zip", method = "curl")

## unzip file
unzip("household_power_consumption.zip")

## load data

data <- read.table("household_power_consumption.txt", sep = ";" , header = TRUE, na.strings = "?")
datetime <- strptime(paste(data[,1],data[,2]), "%d/%m/%Y %H:%M:%S" )


## subset data

data.subset <- subset(data, datetime>strptime("2007-02-01","%Y-%m-%d") & datetime<strptime("2007-02-03","%Y-%m-%d"))
datetime.subset <- subset(datetime, datetime>strptime("2007-02-01","%Y-%m-%d") & datetime<strptime("2007-02-03","%Y-%m-%d"))
## plot png file 
png("plot4.png")
par(mfcol=c(2,2))
# subplot 1
plot(datetime.subset, data.subset$Global_active_power, type="n", xlab="", ylab="Global active power")
lines(datetime.subset, data.subset$Global_active_power)
# subplot 2
plot(datetime.subset, data.subset$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(datetime.subset, data.subset$Sub_metering_1, col="black")
lines(datetime.subset, data.subset$Sub_metering_2, col="red")
lines(datetime.subset, data.subset$Sub_metering_3, col="blue")
# subplot 3
plot(datetime.subset, data.subset$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(datetime.subset, data.subset$Voltage)
# subplot 4
plot(datetime.subset, data.subset$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(datetime.subset, data.subset$Global_reactive_power)
dev.off()