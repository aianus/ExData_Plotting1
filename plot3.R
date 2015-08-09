data <- read.csv("household_power_consumption.txt",
                 sep = ";",
                 colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),
                 na.strings = c('', '?'))
data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]
datetimes <- as.POSIXlt(paste(data$Date, data$Time, sep=' '), tz = "", '%d/%m/%Y %H:%M:%S')

png(filename = "plot3.png",
    width = 480, height = 480, units = "px")
plot(datetimes, data$Sub_metering_1,
     type = "l",
     xlab='',
     ylab="Energy sub metering",
     col="black");
lines(datetimes, data$Sub_metering_2,
      type = "l",
      col="red");
lines(datetimes, data$Sub_metering_3,
      type = "l",
      col="blue");
legend('topright', lty=1, col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()
