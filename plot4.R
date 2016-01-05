source('./PowerConsumption.R')

png('plot4.png', width=480, height=480)
with(power.consumption, {
  par(mfcol=c(2,2))
  
  #plot2
  plot(Date.Time, Global_active_power,
       type="n",
       xlab="",
       ylab="Global Active Power (killowatts)")
  lines(Date.Time, Global_active_power)
  
  #plot3
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
  
  #topright
  plot(Date.Time, Voltage,
       type='n',
       xlab='datetime')
  lines(Date.Time, Voltage)
  
  #bottomright
  plot(Date.Time, Global_reactive_power,
       type='n',
       xlab='datetime')
  lines(Date.Time, Global_reactive_power)
})
dev.off()

browseURL('plot4.png')