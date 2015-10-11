mydata<-read.table(file = "household_power_consumption.txt", sep=";",stringsAsFactors = FALSE,header=TRUE)
mydata2<-mydata[66637:69516,]
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
mydata2$Global_active_power<-as.numeric(mydata2$Global_active_power)
mydata2$Voltage<-as.numeric(mydata2$Voltage)
dates<-mydata2$Date
times<-mydata2$Time
x <- paste(dates, times)
mydata2$datetime<-strptime(x, "%d/%m/%Y %H:%M:%S")

s1<-mydata2$Sub_metering_1
s2<-mydata2$Sub_metering_2
s3<-mydata2$Sub_metering_3
t<-mydata2$datetime

png("plot3.png", width=480, height=480)
plot(t,s1,type="n",lwd=2, ylab = "Energy sub Metering", xlab="")
points(t,s1,type = "l", col="black")
points(t,s2,type = "l", col="red")
points(t,s3,type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()



