#assuming that flie household_power_consumption.txt is available in working directory.This is where plot1.png will also be created.
#Otherwise change working directories or set path accordingly
household_power <- read.table('household_power_consumption.txt', sep = ";", header=TRUE, na.strings="?", stringsAsFactors = FALSE)
names(household_power)[1] = "Date"
power_two_days <-household_power[household_power$Date=='1/2/2007' | household_power$Date == '2/2/2007', ]
png('plot1.png', width=480, height = 480, units = 'px', type='quartz')
hist(power_two_days$Global_active_power, col='red', main = 'Global Active Power', xlab = 'Global Active Power(kilowatts)')
dev.off()