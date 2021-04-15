power <- read.csv('household_power_consumption.txt', header=TRUE, sep=';')
power$Global_active_power <- as.numeric(power$Global_active_power)
power_reduced <- power[power$Date == '1/2/2007' | power$Date == '2/2/2007',]
power_reduced$Date <- as.POSIXlt(strptime(power_reduced$Date, '%d/%m/%Y'))

png(filename = 'plot3.png')
plot(power_reduced$Sub_metering_1, type = 'l', ylab = 'Energy sub metering')
lines(power_reduced$Sub_metering_2, col='red')
lines(power_reduced$Sub_metering_3, col='blue')
legend('topright', pch=c(''), col=c('black','red','blue'), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1)
dev.off()