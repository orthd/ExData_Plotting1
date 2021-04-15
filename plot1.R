power <- read.csv('household_power_consumption.txt', header=TRUE, sep=';')
power$Global_active_power <- as.numeric(power$Global_active_power)
power_reduced <- power[power$Date == '1/2/2007' | power$Date == '2/2/2007',]

png(filename = 'plot1.png')
hist(power_reduced$Global_active_power, 
     xlab='Global Active Power (kilowatts)', 
     main = 'Global Active Power',
     col='red')
dev.off()