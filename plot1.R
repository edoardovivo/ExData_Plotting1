
library(lubridate)

#Reads the Data
data_power <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, na="?", header=TRUE)
#Converts the date using lubridate
data_power$Date <- dmy(data_power$Date)
#Extracts only the mentioned dates
cond <- data_power$Date >= ymd("2007-02-01") & data_power$Date <= ymd("2007-02-02")
data_power <- data_power[cond,]

#Builds the histogram and writes it to a file
png("plot1.png") #Default is already 480x480
hist(data_power$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()