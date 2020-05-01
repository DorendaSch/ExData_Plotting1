#1. Download and unzip file
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "electric.zip")
unzip("electric.zip", exdir = "electric")
electric<-read.table("household_power_consumption.txt", sep=";", header=TRUE,dec=".")

#2. Select cases on dates 2007-02-01 and 2007-02-02
subsetDate<-subset(electric,electric$Date=="1/2/2007"|electric$Date=="2/2/2007")

#3. Make global active power numeric, combine Date&Time in correct format
globalActivePower<-as.numeric(as.character(subsetDate$Global_active_power))
datetime <- strptime(paste(subsetDate$Date, subsetDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#4. Make linegraph of global active power over time
##NOTE: labels of x-axis are in Dutch(sorry...); do=Thu, vr=Fri, za=Sat
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type = "l", ylab="Global Active Power (kilowatts)", xlab="", )
dev.off()

