#assuming that flie household_power_consumption.txt is available in working directory.This is where plot1.png will also be created.
#Otherwise change working directories or set path accordingly
household_power <- read.table('household_power_consumption.txt', sep = ";", header=TRUE, na.strings="?", stringsAsFactors = FALSE)
names(household_power)[1] = "Date"
power_two_days <-household_power[household_power$Date=='1/2/2007' | household_power$Date == '2/2/2007', ]
png('plot2.png', width=480, height = 480, units = 'px', type='quartz')
power_two_days <- cbind(power_two_days, as.POSIXct(paste(power_two_days$Date, power_two_days$Time), format = "%d/%m/%Y %H:%M:%S"))
#set the name of new column
names(power_two_days)[10] = "Date_time"
plot(power_two_days$Date_time, power_two_days$Global_active_power, xlab = '', ylab = 'Global Active Power (killowatts)' , type='l')
dev.off()