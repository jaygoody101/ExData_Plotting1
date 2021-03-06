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
png(filename="plot2.png",width = 480, height = 480, units = "px")
##
## make plot 2
with(powercons,plot(datetime, Global_active_power,xlab="",ylab="",type="l",col="black"))
title(ylab="Global Active Power (kilowatts)")
##
## close png device
dev.off()