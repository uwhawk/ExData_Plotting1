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

###Plot 3
png(file = "plot3.png", width = 5, height = 5, units = "in", res = 300) #open png
plot(d[,10], d$Sub_metering_1, xlab=" ", ylab="Energy sub metering", type="l", font.lab=2, main="Plot 3")
lines(d[,10], d$Sub_metering_2, type="l", col="red")
lines(d[,10], d$Sub_metering_3, type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2,col=c("black", "red", "blue"))
dev.off() # close the png
