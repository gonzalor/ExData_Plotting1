# Course    : Exploratory Data Analysis
# Assignment: 1
# Exercise  : Plot1.R
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
png(filename = "plot1.png", width = 480, height = 480)

# Plot Histogram
with(t, hist(Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power"))

# Close Png
dev.off()

