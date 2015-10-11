mydata<-read.table(file = "household_power_consumption.txt", sep=";",stringsAsFactors = FALSE,header=TRUE)
mydata2<-mydata[66637:69516,]
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
mydata2$Global_active_power<-as.numeric(mydata2$Global_active_power)
mydata2$Voltage<-as.numeric(mydata2$Voltage)
dates<-mydata2$Date
times<-mydata2$Time
x <- paste(dates, times)
mydata2$datetime<-strptime(x, "%d/%m/%Y %H:%M:%S")

plot(mydata2$datetime,mydata2$Global_active_power,type="l",lwd=2, ylab = "Global Active Power(kilowats)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()