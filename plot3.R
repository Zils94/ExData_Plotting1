#Library

library(lubridate)

# Define Working Directory

wd<-"/Users/Zils2/Downloads/"
setwd(wd)

# Open file

hs<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
hs$DayTime<-strptime(paste(hs$Date,hs$Time),"%d/%m/%Y %H:%M:%S")
hs<-hs[which(hs$DayTime>="2007-02-01 00:00:00" & hs$DayTime<"2007-02-03 00:00:00"),]
hs$Global_active_power<-as.numeric(as.character(hs$Global_active_power))

# Plot 3

wdf<-"/Users/Zils2/Desktop/COURSERA/4. Exploratory Data Analysis/ExData_Plotting1/"
setwd(wdf)

png('plot3.png',width = 480, height = 480)

plot(hs$DayTime,hs$Sub_metering_1,type="lines",xlab="",ylab="Energy sub metering")
points(hs$DayTime,hs$Sub_metering_2,type="lines",col="red")
points(hs$DayTime,hs$Sub_metering_3,type="lines",col="blue")
legend("topright",col=c("black","red","blue"),lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
