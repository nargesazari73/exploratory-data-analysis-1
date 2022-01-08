df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

d <- df %>% filter(DateTime >= "2007-02-01", DateTime < "2007-02-03") 
dim(d)

## Plot 2
g <- ggplot(data = d) + geom_line(aes(x = DateTime, y = Global_active_power))
g

png("plot2.png", width=480, height=480)

plot(x = d$DateTime
     , y = d$Global_active_power
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
