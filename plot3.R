##uploading  and subseting data
setwd("~/R")
data<-read.delim("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
library(lubridate)
data$v1<-paste(as.character(data$Date),as.character(data$Time))
data$Date<-dmy(as.character(data$Date))
data$Time<-hms(as.character(data$Time))
data$v1<-dmy_hms(data$v1)
data2<-subset(data,data$Date=="2007-02-01 " | data$Date=="2007-02-02 " )
data2$Sub_metering_1<-as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2<-as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3<-as.numeric(as.character(data2$Sub_metering_3))
##Creating graph
png(filename = "plot3.png",width = 480, height = 480, units = "px")
plot(data2$v1,data2$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(data2$v1,data2$Sub_metering_2,col="red")
lines(data2$v1,data2$Sub_metering_3,col="blue")
legend("topright", legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col=c("black", "red", "blue"),lwd=c(1.5,1.5,1.5), cex=0.8)
dev.off()


