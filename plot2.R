library('sqldf')
unzip('household_power_consumption.zip')
hpc = read.csv.sql("household_power_consumption.txt", sep = ';', header=TRUE, sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'")
png('plot2.png')
plot(x = strptime(paste(hpc$Date, hpc$Time), format = '%d/%m/%Y %H:%M:%S'), y=hpc$Global_active_power, type='l', main='Global Active Power', ylab='Global Active Power', xlab='')
axis(1, c(as.numeric(strptime('1/2/2007 0:0:0', format='%d/%m/%Y %H:%M:%S')),
          as.numeric(strptime('2/2/2007 0:0:0', format='%d/%m/%Y %H:%M:%S')), 
          as.numeric(strptime('3/2/2007 0:0:0', format='%d/%m/%Y %H:%M:%S'))),
     c("Thu", "Fri", "Sat"))
dev.off()
unlink('household_power_consumption.txt')