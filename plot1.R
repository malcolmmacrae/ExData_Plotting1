#   Set working directory.
setwd("C:/Users/mmacrae/Coursera/4. Exploratory Data Analysis/Assignment #1")

#   Load all data from text file into data frame.
power.all <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                        colClasses=c(rep("factor",2),rep("numeric",7)),
                        na.strings=c("?"))
str(power.all)

#   Subset data frame to 1-Feb-2007 and 2-Feb-2007.
power <- power.all[power.all$Date %in% c("1/2/2007","2/2/2007"),]

#   Reset global parameters.
par(mfrow=c(1,1))

#   Plot 1.
png("plot1.png",width=480,height=480)
hist(power$Global_active_power,breaks=seq(0,10,.5),col="red",
     main="Global Active Power",xlab="Global Active Power (kilowatts)",
     xlim=c(0,7),xaxt="n")
axis(1,seq(0,6,2))
dev.off()
