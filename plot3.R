## Read Data; Subset Feb 1, 2007; Convert to Dataframe
library(data.table)
data_in <-fread("household_power_consumption.txt",na.strings="?")
powercons <- data.frame(subset(data_in,Date =="1/2/2007" | Date=="2/2/2007"))
##
## remove original data table
rm(data_in)
##
## Create datetime variable as Date/Time class 
powercons$datetime <- strptime(paste(powercons$Date, powercons$Time), "%d/%m/%Y %H:%M:%S") 
##
## enable png device
#(filename="plot3.png",width = 480, height = 480, units = "px")
##
## make plot 3
with(powercons,plot(datetime, Sub_metering_1,xlab="",ylab="",type="l",col="black"))
title(ylab="Energy sub metering")
lines(powercons$datetime,powercons$Sub_metering_2,type="l",col="red")
lines(powercons$datetime,powercons$Sub_metering_3,type="l",col="blue")
legend("topright", lty=c(1,1,1),col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##
## close png device
#dev.off()