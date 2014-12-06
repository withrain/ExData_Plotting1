library('sqldf')
unzip('household_power_consumption.zip')
hpc = read.csv.sql("household_power_consumption.txt", sep = ';', header=TRUE, 
                   sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'")
png('plot3.png')
plot(x = strptime(paste(hpc$Date, hpc$Time), format = '%d/%m/%Y %H:%M:%S'), 
     y=hpc$Sub_metering_1, type='l', main='', ylab='Energe sub metering', xlab='')
points(x = strptime(paste(hpc$Date, hpc$Time), format = '%d/%m/%Y %H:%M:%S'), 
     y=hpc$Sub_metering_2, type='l', col="red")
points(x = strptime(paste(hpc$Date, hpc$Time), format = '%d/%m/%Y %H:%M:%S'), 
       y=hpc$Sub_metering_3, type='l', col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, c(as.numeric(strptime('1/2/2007 0:0:0', format='%d/%m/%Y %H:%M:%S')),
          as.numeric(strptime('2/2/2007 0:0:0', format='%d/%m/%Y %H:%M:%S')), 
          as.numeric(strptime('3/2/2007 0:0:0', format='%d/%m/%Y %H:%M:%S'))),
     c("Thu", "Fri", "Sat"))
dev.off()
unlink('household_power_consumption.txt')