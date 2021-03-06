library('sqldf')
unzip('household_power_consumption.zip')
hpc = read.csv.sql("household_power_consumption.txt", sep = ';', header=TRUE, 
                   sql = "select * from file where Date='1/2/2007' or Date='2/2/2007'")
png('plot1.png')
hist(hpc$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', 
     main='Global Active Power')
dev.off()
unlink('household_power_consumption.txt')