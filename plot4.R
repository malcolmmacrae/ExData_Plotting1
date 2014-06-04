#   Set working directory.
setwd("C:/Users/mmacrae/Coursera/4. Exploratory Data Analysis/Assignment #1")

#   Load all data from text file into data frame.
power.all <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                        colClasses=c(rep("factor",2),rep("numeric",7)),
                        na.strings=c("?"))
str(power.all)

#   Subset data frame to 1-Feb-2007 and 2-Feb-2007.
power <- power.all[power.all$Date %in% c("1/2/2007","2/2/2007"),]

#   Convert date and time variables to combined date-time variable for time-series.
power$DateTime <- as.POSIXct(paste(power$Date,power$Time),"%d/%m/%Y %H:%M:%S", tz="GMT")

#   Plot 4.
## Open PNG bitmap file device.
png("plot4.png",width=480,height=480)

## Define 2x2 grid of plot areas.
par(mfrow=c(2,2))

## First row, first column.
with(power,plot(DateTime,Global_active_power,type="l",
                xlab="",ylab="Global Active Power"))

## First row, second column.
with(power,plot(DateTime,Voltage,type="l",
                xlab="datetime",ylab="Voltage"))

## Second row, first column.
with(power,plot(DateTime,Sub_metering_1,type="l",col="black",
                xlab="",ylab="Energy sub metering"))
with(power,lines(DateTime,Sub_metering_2,col="red"))
with(power,lines(DateTime,Sub_metering_3,col="blue"))
with(power,legend("topright",lty=1,col=c("black","blue","red"),
                  legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                  bty="n"))

## Second row, second column.
with(power,plot(DateTime,Global_reactive_power,type="l",
                xlab="datetime",ylab="Global_reactive_power"))

## Close file device.
dev.off()