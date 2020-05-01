#1. Download and unzip file
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "electric.zip")
unzip("electric.zip", exdir = "electric")
electric<-read.table("household_power_consumption.txt", sep=";", header=TRUE,dec=".")

#2. Select cases on dates 2007-02-01 and 2007-02-02
subsetDate<-subset(electric,electric$Date=="1/2/2007"|electric$Date=="2/2/2007")

#3. make a histogram of global active power
globalActivePower<-as.numeric(subsetDate$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()