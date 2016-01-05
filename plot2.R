source('./PowerConsumption.R')

png('plot2.png', width=480, height=480)
with(power.consumption, {
  plot(Date.Time, Global_active_power,
       type="n",
       xlab="",
       ylab="Global Active Power (killowatts)")
  lines(Date.Time, Global_active_power)
})
dev.off()

# browseURL('plot2.png')