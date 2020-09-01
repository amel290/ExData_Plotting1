#uploading  and subseting data
setwd("~/R")
data<-read.delim("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
library(lubridate)
data$v1<-paste(as.character(data$Date),as.character(data$Time))
data$Date<-dmy(as.character(data$Date))
data$Time<-hms(as.character(data$Time))
data$v1<-dmy_hms(data$v1)
data2<-subset(data,data$Date=="2007-02-01 " | data$Date=="2007-02-02 " )
data2$ Global_active_power<-as.numeric(as.character(data2$ Global_active_power))
# creating graph
png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(data2$ Global_active_power,main ="Global Active power",xlab="Global Active power(kilowatts)",col="red")
dev.off()