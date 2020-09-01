## uploading  and subseting data
setwd("~/R")
data<-read.delim("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
library(lubridate)
data$v1<-paste(as.character(data$Date),as.character(data$Time))
data$Date<-dmy(as.character(data$Date))
data$Time<-hms(as.character(data$Time))
data$v1<-dmy_hms(data$v1)
data2<-subset(data,data$Date=="2007-02-01 " | data$Date=="2007-02-02 " )
data2$ Global_active_power<-as.numeric(as.character(data2$ Global_active_power))
## creating graph
png(filename = "plot2.png",width = 480, height = 480, units = "px")
plot(data2$v1,data2$Global_active_power,xlab="",ylab="Global Active power(kilowatts)",type="l")
dev.off()

