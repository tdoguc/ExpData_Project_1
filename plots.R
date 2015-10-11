#setwd("~/R Files")
mydata<-read.table(file = "household_power_consumption.txt", sep=";",stringsAsFactors = FALSE,header=TRUE)
#mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")
mydata2<-mydata[66637:69516,]
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
mydata2$Global_active_power<-as.numeric(mydata2$Global_active_power)
mydata2$Voltage<-as.numeric(mydata2$Voltage)

dates<-mydata2$Date
times<-mydata2$Time
x <- paste(dates, times)
mydata2$datetime<-strptime(x, "%d/%m/%Y %H:%M:%S")

#Plot1
with(mydata2,hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))

#Plot2
plot(mydata2$datetime,mydata2$Global_active_power,type="l",lwd=2, ylab = "Global Active Power(kilowats)", xlab="")


#Plot3
s1<-mydata2$Sub_metering_1
s2<-mydata2$Sub_metering_2
s3<-mydata2$Sub_metering_3
t<-mydata2$datetime

plot(t,s1,type="n",lwd=2, ylab = "Energy sub Metering", xlab="")
points(t,s1,type = "l", col="black")
points(t,s2,type = "l", col="red")
points(t,s3,type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Plot4
par(mfrow=c(2,2))
plot(mydata2$datetime,mydata2$Global_active_power,type="l",lwd=2, ylab = "Global Active Power(kilowats)", xlab="")
plot(t,mydata2$Voltage ,type="l", ylab = "Voltage", xlab="")
plot(t,s1,type="n",lwd=2, ylab = "Energy sub Metering", xlab="", xaxp=c(0,30,10))
points(t,s1,type = "l", col="black")
points(t,s2,type = "l", col="red")
points(t,s3,type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(t,mydata2$Global_reactive_power ,type="l", ylab = "Global_reactive_power", xlab="datetime")




