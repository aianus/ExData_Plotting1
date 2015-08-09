setClass('myDate');
setAs("character","myDate", function(from) { as.Date(from, "%d/%m/%Y") });
data <- read.csv("household_power_consumption.txt",
                 sep = ";",
                 colClasses = c('myDate', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),
                 na.strings = c('', '?'))
data <- data[data$Date %in% c(as.Date('2007-02-01'), as.Date('2007-02-02')),]

png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
hist(data$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     ylim=c(0,1200),
     col='red'
)
dev.off()
