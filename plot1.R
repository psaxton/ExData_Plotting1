source('./PowerConsumption.R')

png(filename='plot1.png', width=480, height=480)

hist(power.consumption$Global_active_power,
     main='Global Active Power',
     xlab='Global Active Power (killowatts)',
     ylab='Frequency',
     col='red')

dev.off()

# browseURL('plot1.png')