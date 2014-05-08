###file="household_power_consumption.txt"
###Format and extract data for 2007-02-01 & 2007-02-02

power<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
power <- transform(power, ctime = strptime(paste(power[,1], power[,2]), "%d/%m/%Y %H:%M:%S"))
power$Date <- as.Date(power$Date, "%d/%m/%Y")
d<-subset(power, as.Date(power$Date) >= '2007-02-01' & as.Date(power$Date) <= '2007-02-02') 
d[,3:8] <- sapply(d[,3:8],as.numeric)
str(d)
head(d)
tail(d)


#############################Combo Plot
png(file = "plot4.png", width = 9, height = 9, units = "in", res = 300) #open png
par(mfrow=c(2,2))

######Plot 1
plot(d[,10], d[,3], xlab=" ", ylab="Global Active Power (kilowatts)", type="l")
mtext("Plot 4", side=3)
######Plot 2


###Plot 3

plot(d[,10], d$Sub_metering_1, xlab=" ", ylab="Energy sub metering", type="l", font.lab=2)
lines(d[,10], d$Sub_metering_2, type="l", col="red")
lines(d[,10], d$Sub_metering_3, type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2,col=c("black", "red", "blue"))

###Plot 4

plot(d[,10], d$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")


par(mfrow=c(1,1))
dev.off() # close the png