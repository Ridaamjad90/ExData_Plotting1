library("data.table")
Power2 <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")
Power2 [, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
Power2 [, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
Power2 <- Power2[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot2.png", width=480, height=480)
plot(x = Power2 [, dateTime],  y = Power2 [, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
