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

######Plot 1
png(file = "plot1.png", width = 5, height = 5, units = "in", res = 300) #open png
hist(d[,3], xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Plot 1  \nGlobal Active Power", col="red")
rug(d[,3])
dev.off() # close the png


