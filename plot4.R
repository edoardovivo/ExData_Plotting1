library(lubridate)

#Reads the Data
data_power <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, na="?", header=TRUE)
#Converts the date using lubridate
data_power$Date <- dmy(data_power$Date)
#Extracts only the mentioned dates
cond <- data_power$Date >= ymd("2007-02-01") & data_power$Date <= ymd("2007-02-02")
data_power <- data_power[cond,]

#Add time
data_power$DateTime <- ymd_hms(paste(data_power$Date, data_power$Time, sep=" "))

#Plots Data to png
png("plot4.png")
par(mfrow = c(2, 2))

with(data_power, {
        plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
        plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        points(DateTime, Sub_metering_2, type="l", col="red")
        points(DateTime, Sub_metering_3, type="l", col="blue")
        legend("topright", bty="n", lty = 1, col = c("black","red", "blue"), 
               legend = names(data_power)[grep("Sub", names(data_power))])
        plot(DateTime, Global_reactive_power, type="l", xlab="datetime")
} )
     
dev.off()




