# Course    : Exploratory Data Analysis
# Assignment: 1
# Exercise  : Plot4.R
# Author    : gonzarodri@gmail.com

# Reads text lines
l <- readLines("household_power_consumption.txt")

# Filter header and specified Dates
l <- l[grep("^(Date;Time;|1/2/2007|2/2/2007)", l)]

# Create table
t <- read.table(text = l, stringsAsFactors = FALSE, sep = ";", na.strings = "?", header = TRUE)

# Create DateTime Column
t <- transform(t, DateTime = strptime(paste(t$Date,t$Time), "%d/%m/%Y %H:%M:%S"))

# Open Png Device
png(filename = "plot4.png", width = 480, height = 480)

Sys.setlocale("LC_TIME", "English")

par(mfcol = c(2,2))

# Chart 1
with(t, 
     plot(
         DateTime, 
         Global_active_power, 
         type="n", 
         ylab = "Global Active Power",
         xlab = ""
     ))
with(t, lines(x=DateTime, y=Global_active_power))

# Chart 2
with(t, 
     plot(
         DateTime, 
         Sub_metering_1, 
         type="n", 
         ylab = "Energy sub metering",
         xlab = ""
     ))
with(t, lines(x=DateTime, y=Sub_metering_1))
with(t, lines(x=DateTime, y=Sub_metering_2, col = "red"))
with(t, lines(x=DateTime, y=Sub_metering_3, col = "blue"))

legend("topright",  lty=c(1,1,1),  col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")


# Chart 3
with(t, 
     plot(
         DateTime, 
         Voltage, 
         type="n", 
         ylab = "Voltage",
         xlab = "datetime"
     ))
with(t, lines(x=DateTime, y=Voltage))

# Chart 4
with(t, 
     plot(
         DateTime, 
         Global_reactive_power, 
         type="n", 
         ylab = "Global_reactive_power",
         xlab = "datetime"
     ))
with(t, lines(x=DateTime, y=Global_reactive_power))


# Close Png
dev.off()

