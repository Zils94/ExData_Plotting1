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

# Plot 1

wdf<-"/Users/Zils2/Desktop/COURSERA/4. Exploratory Data Analysis/ExData_Plotting1/"
setwd(wdf)

png('plot1.png',width = 480, height = 480)
hist(hs$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
