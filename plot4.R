#1. Download and unzip file
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "electric.zip")
unzip("electric.zip", exdir = "electric")
electric<-read.table("household_power_consumption.txt", sep=";", header=TRUE,dec=".")

#2. Select cases
subsetDate<-subset(electric,electric$Date=="1/2/2007"|electric$Date=="2/2/2007")
datetime <- strptime(paste(subsetDate$Date, subsetDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower<-as.numeric(as.character(subsetDate$Global_active_power))
globalReactivePower<-as.numeric(as.character(subsetDate$Global_reactive_power))
voltage<-as.numeric(as.character(subsetDate$Voltage))

#3 Make plots
##NOTE: labels of x-axis are in Dutch(sorry...); do=Thu, vr=Fri, za=Sat
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type = "l", ylab="Global Active Power (kilowatts)", xlab="", )
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subsetDate$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="", )
lines(datetime, subsetDate$Sub_metering_2,type = "l", col="red")
lines(datetime, subsetDate$Sub_metering_3,type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

