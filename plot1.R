# Read data
data <- read.table("/Users/josemora/Downloads/file.txt",header = TRUE, sep = ";")

# Convertir fecha a tipo.fecha
data$Date <- as.Date(data$Date , "%d/%m/%Y")

# Convertir hora a tipo.hora
install.packages("chron")
library(chron)
data$Time <- chron(times=data$Time)

# filtrar data entre 01-02-2007 y 03-02-2007
install.packages("dplyr")
library(dplyr)
data2<- filter(data, data$Date=='2007-02-01' | data$Date=='2007-02-02')
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
data2$Global_reactive_power <- as.numeric(as.character(data2$Global_reactive_power))
data2$Voltage <- as.numeric(as.character(data2$Voltage))
data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))
hist(data2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
png(filename = "/Users/josemora/Documents/R codes/plot1.png")
hist(data2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()