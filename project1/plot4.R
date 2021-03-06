#assuming that flie household_power_consumption.txt is available in working directory.This is where plot1.png will also be created.
#Otherwise change working directories or set path accordingly
household_power <- read.table('household_power_consumption.txt', sep = ";", header=TRUE, na.strings="?", stringsAsFactors = FALSE)
names(household_power)[1] = "Date"
power_two_days <-household_power[household_power$Date=='1/2/2007' | household_power$Date == '2/2/2007', ]
png('plot4.png', width=480, height = 480, units = 'px', type='quartz')
power_two_days <- cbind(power_two_days, as.POSIXct(paste(power_two_days$Date, power_two_days$Time), format = "%d/%m/%Y %H:%M:%S"))
#set the name of new column
names(power_two_days)[10] = "Date_time"
par(mfrow = c(2,2))
with (power_two_days, {
  plot(power_two_days$Date_time, power_two_days$Global_active_power, xlab = '', ylab = 'Global Active Power (killowatts)' , type='l')
  plot(power_two_days$Date_time, power_two_days$Voltage, xlab = 'datetime', ylab = 'Voltage' , type='l')
  plot(power_two_days$Date_time, power_two_days$Sub_metering_1, xlab = '', ylab = 'Energy Sub Metering' , type='l')
  lines(power_two_days$Date_time, power_two_days$Sub_metering_2, col='red')
  lines(power_two_days$Date_time, power_two_days$Sub_metering_3, col='blue')
  legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') , 
         lty=1, col=c('black', 'red', 'blue'), bty='n', cex=.75)
  plot(power_two_days$Date_time, power_two_days$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power' , type='l')
})
dev.off()