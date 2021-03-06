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

#   Reset global parameters.
par(mfrow=c(1,1))

#   Plot 2.
png("plot2.png",width=480,height=480)
with(power,plot(DateTime,Global_active_power,type="l",
                xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()
