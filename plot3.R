#plot3
library(tidyr)
library(dplyr)
library(lubridate)
setwd("~/R")
plot3names<-read.table("household_power_consumption.txt",header=FALSE,nrows=1,sep=";",na.strings="?",stringsAsFactors = FALSE)
plot3data<-read.table("household_power_consumption.txt",header=FALSE,skip=66637,nrows=2880,sep=";")
colnames(plot3data)<-plot3names
# convert the Date and Time variables to Date/Time classes in R using the strptime()  and as.Date() functions.
plot3data<-unite(plot3data,"Date_Time",Date,Time,sep=" ",remove = TRUE)
plot3data$Date_Time<-strptime(plot3data$Date_Time,"%d/%m/%Y %H:%M:%S")
png("plot3.png",width = 480,height=480)
#plot(x=plot3data$Date_Time,y=c(plot3data$Sub_metering_1,plot3data$Sub_metering_2,plot3data$Sub_metering_3), type="l",ylab="Energy sub metering", xlab="")
with(plot3data,plot(x=Date_Time,y=Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(plot3data,lines(Date_Time,Sub_metering_2,col="red"))
with(plot3data,lines(Date_Time,Sub_metering_3,col="blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()