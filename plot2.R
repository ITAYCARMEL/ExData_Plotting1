#plot2
library(tidyr)
library(dplyr)
library(lubridate)
setwd("~/R")
plot2names<-read.table("household_power_consumption.txt",header=FALSE,nrows=1,sep=";",na.strings="?",stringsAsFactors = FALSE)
plot2data<-read.table("household_power_consumption.txt",header=FALSE,skip=66637,nrows=2880,sep=";")
colnames(plot2data)<-plot2names
# convert the Date and Time variables to Date/Time classes in R using the strptime()  and as.Date() functions.
plot2data<-unite(plot2data,"Date_Time",Date,Time,sep=" ",remove = TRUE)
plot2data$Date_Time<-strptime(plot2data$Date_Time,"%d/%m/%Y %H:%M:%S")
png("plot2.png",width = 480,height=480)
plot(plot2data$Date_Time,plot2data$Global_active_power, type="l",ylab="Global Active Power (killowatts)", xlab="")
dev.off()