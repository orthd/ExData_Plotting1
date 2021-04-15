power <- read.csv('household_power_consumption.txt', header=TRUE, sep=';')
power$Global_active_power <- as.numeric(power$Global_active_power)
power_reduced <- power[power$Date == '1/2/2007' | power$Date == '2/2/2007',]
power_reduced$Date <- as.Date(strptime(power_reduced$Date, '%d/%m/%Y'))

png(filename = 'plot2.png')
plot(power_reduced$Global_active_power, ylab = 'Global Active Power (kilowatts)', type='l')
dev.off()