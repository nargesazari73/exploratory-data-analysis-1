url <- "C:/Users/manue/OneDrive/Data Science JHU/Exploratory/exdata_data_household_power_consumption/household_power_consumption.txt"
data <- read.table(url,sep = ";",header = TRUE)

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

data <- data %>% filter(DateTime >= "2007-02-01", DateTime <= "2007-02-03") 

head(data)

data$Global_active_power <- as.numeric(data$Global_active_power)
data <- data[complete.cases(data),]

hist(data$Global_active_power, col="red", main="Global Active Power", xlab = "Global active power in kilowatts")
