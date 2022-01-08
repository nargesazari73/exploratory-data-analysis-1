url <- "C:/Users/manue/OneDrive/Data Science JHU/Exploratory/exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table(url,sep = ";",header = TRUE)

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

data <- data %>% filter(DateTime >= "2007-02-01", DateTime <= "2007-02-03") 

data$Global_active_power <- as.numeric(data$Global_active_power)
data <- data[complete.cases(data),]

png("plot3.png", width=480, height=480)

# Plot 3
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
dev.off()
