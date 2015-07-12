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

## plot png file of histogram
png("plot1.png")
hist(data.subset$Global_active_power, col="red", xlab="Global active power (kilowatts)", main="Global active power")
dev.off()