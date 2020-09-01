## uploading and subsetting data
setwd("~/R")
data<-read.delim("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
library(lubridate)
data$v1<-paste(as.character(data$Date),as.character(data$Time))
data$Date<-dmy(as.character(data$Date))
data$Time<-hms(as.character(data$Time))
data$v1<-dmy_hms(data$v1)
data2<-subset(data,data$Date=="2007-02-01 " | data$Date=="2007-02-02 " )
data2$ Global_active_power<-as.numeric(as.character(data2$ Global_active_power))
data2$Sub_metering_1<-as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2<-as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3<-as.numeric(as.character(data2$Sub_metering_3))
data2$Voltage<-as.numeric(as.character(data2$Voltage))
data2$Global_reactive_power<-as.numeric(as.character(data2$Global_reactive_power))


## Creating graph

png(filename = "plot4.png",width = 800, height = 800, units = "px")
par(mfrow=c(2,2))
plot(data2$v1,data2$Global_active_power,xlab="",ylab="Global Active power(kilowatts)",type="l")
plot(data2$v1,data2$Voltage,xlab="datetime",ylab="Voltage",type="l")
plot(data2$v1,data2$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(data2$v1,data2$Sub_metering_2,col="red")
lines(data2$v1,data2$Sub_metering_3,col="blue")
legend("topright", legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col=c("black", "red", "blue"),lwd=c(1.5,1.5,1.5), cex=0.8,box.lty=0)
plot(data2$v1,data2$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()