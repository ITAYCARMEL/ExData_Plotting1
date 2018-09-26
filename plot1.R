#plot1
library(tidyr)
library(dplyr)
library(lubridate)
setwd("~/R")
plot1names<-read.table("household_power_consumption.txt",header=FALSE,nrows=1,sep=";",na.strings="?",stringsAsFactors = FALSE)
plot1data<-read.table("household_power_consumption.txt",header=FALSE,skip=66637,nrows=2880,sep=";")
colnames(plot1data)<-plot1names
# convert the Date and Time variables to Date/Time classes in R using the strptime()  and as.Date() functions.
plot1data<-unite(plot1data,"Date_Time",Date,Time,sep=" ",remove = TRUE)
plot1data$Date_Time<-strptime(plot1data$Date_Time,"%d/%m/%Y %H:%M:%S")
#plot1data$Date_Time<-as.Date(plot1data$Date_Time)
png("plot1.png",width = 480,height=480)
hist(plot1data$Global_active_power,main="Global Active Power",xlab="Global Active Power (killowatts)",col="red",xlim=c(0,6),ylim=c(0,1200), breaks = 12)
dev.off()
