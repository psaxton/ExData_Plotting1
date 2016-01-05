library(dplyr)
library(lubridate)

if (!exists("power.consumption") || is.null(attr(power.consumption, "load.time")))
with(new.env(), {
  data.dir <- "./data"
  data.archive <- "./data/household_power_consumption.zip"
  data.file <- "./data/household_power_consumption.txt"
  
  if (!dir.exists(data.dir))
    dir.create(data.dir)
  
  if (!file.exists(data.archive))
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  data.archive, mode = "wb")
  if (!file.exists(data.file))
    unzip(data.archive, exdir = data.dir)
  
  # Fail if not enough memory
  stopifnot (file.size(data.file) < memory.limit() * 2**20)
  
  power.consumption <<-
    read.csv(data.file,
             sep = ';',
             check.names = TRUE,
             colClasses = c("character", "character", replicate(7, "numeric")),
             na.strings = "?") %>%
    mutate(Date.Time = paste(Date, Time) %>% dmy_hms) %>%
    filter(Date.Time >= dmy("1-Feb-2007") & Date.Time < dmy("3-Feb-2007")) %>%
    select(Date.Time, Global_active_power, Global_reactive_power, Voltage,
           Global_intensity, Sub_metering_1, Sub_metering_2, Sub_metering_3)
  
  attr(power.consumption, "load.time") <- now()
})