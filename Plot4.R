png("plot4.png", width=480, height=480)

url <- "C:/Users/manue/OneDrive/Data Science JHU/Exploratory/exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table(url,sep = ";",header = TRUE)

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

data <- data %>% filter(DateTime >= "2007-02-01", DateTime <= "2007-02-03") 

data$Global_active_power <- as.numeric(data$Global_active_power)
data <- data[complete.cases(data),]

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# Plot 1
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
