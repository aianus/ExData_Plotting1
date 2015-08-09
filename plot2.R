data <- read.csv("household_power_consumption.txt",
                 sep = ";",
                 colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),
                 na.strings = c('', '?'))
data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]
datetimes <- as.POSIXlt(paste(data$Date, data$Time, sep=' '), tz = "", '%d/%m/%Y %H:%M:%S')

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
plot(datetimes, data$Global_active_power,
     type = "l",
     xlab='',
     ylab="Global Active Power (kilowatts)")
dev.off()
