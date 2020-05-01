#1. Download and unzip file
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "electric.zip")
unzip("electric.zip", exdir = "electric")
electric<-read.table("household_power_consumption.txt", sep=";", header=TRUE,dec=".")

#2. Select cases on dates 2007-02-01 and 2007-02-02
subsetDate<-subset(electric,electric$Date=="1/2/2007"|electric$Date=="2/2/2007")

#3. Combine Date&Time in correct format
datetime <- strptime(paste(subsetDate$Date, subsetDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#4. Make graph of energy sub meterings over time
##NOTE: labels of x-axis are in Dutch(sorry...); do=Thu, vr=Fri, za=Sat
png("plot3.png", width=480, height=480)
plot(datetime, subsetDate$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="", )
lines(datetime, subsetDate$Sub_metering_2,type = "l", col="red")
lines(datetime, subsetDate$Sub_metering_3,type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()