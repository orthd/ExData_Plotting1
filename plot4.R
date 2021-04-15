power <- read.csv('household_power_consumption.txt', header=TRUE, sep=';')
power$Global_active_power <- as.numeric(power$Global_active_power)
power_reduced <- power[power$Date == '1/2/2007' | power$Date == '2/2/2007',]
power_reduced$Date <- as.POSIXlt(strptime(power_reduced$Date, '%d/%m/%Y'))

png(filename = 'plot4.png')

par(mfrow=c(2,2))

plot(power_reduced$Global_active_power, ylab = 'Global Active Power (kilowatts)', type='l')

plot(power_reduced$Voltage, ylab = 'Voltage', type='l')

plot(power_reduced$Sub_metering_1, type = 'l', ylab = 'Energy sub metering')
lines(power_reduced$Sub_metering_2, col='red')
lines(power_reduced$Sub_metering_3, col='blue')
legend('topright', pch=c(''), col=c('black','red','blue'), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1)

plot(power_reduced$Global_reactive_power, type='l', ylab = 'Global_reactive_power')

dev.off()