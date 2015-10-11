mydata<-read.table(file = "household_power_consumption.txt", sep=";",stringsAsFactors = FALSE,header=TRUE)
mydata2<-mydata[66637:69516,]
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
mydata2$Global_active_power<-as.numeric(mydata2$Global_active_power)
mydata2$Voltage<-as.numeric(mydata2$Voltage)
dates<-mydata2$Date
times<-mydata2$Time
x <- paste(dates, times)
mydata2$datetime<-strptime(x, "%d/%m/%Y %H:%M:%S")
s1<-as.numeric(mydata2$Sub_metering_1)
s2<-as.numeric(mydata2$Sub_metering_2)
s3<-as.numeric(mydata2$Sub_metering_3)
t<-mydata2$datetime

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(mydata2$datetime,mydata2$Global_active_power,type="l",lwd=2, ylab = "Global Active Power(kilowats)", xlab="")
plot(t,mydata2$Voltage ,type="l", ylab = "Voltage", xlab="")
plot(t, s1, type="l", ylab="Energy Submetering", xlab="")
lines(t, s2, type="l", col="red")
lines(t, s3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(t,mydata2$Global_reactive_power ,type="l", ylab = "Global_reactive_power", xlab="datetime")
dev.off()
