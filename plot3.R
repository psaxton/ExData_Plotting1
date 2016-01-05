source('./PowerConsumption.R')

png('plot3.png', width=480, height=480)
with(power.consumption, {
  plot(Date.Time, Sub_metering_1,
       type="n",
       xlab="",
       ylab="Energy sub metering")
  lines(Date.Time, Sub_metering_1,
        col='black')
  lines(Date.Time, Sub_metering_2,
        col='red')
  lines(Date.Time, Sub_metering_3,
        col='blue')
  legend('topright',
         legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
         lwd=1,
         col=c('black', 'red', 'blue'))
})
dev.off()

# browseURL('plot3.png')