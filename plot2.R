# Course    : Exploratory Data Analysis
# Assignment: 1
# Exercise  : Plot2.R
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
png(filename = "plot2.png", width = 480, height = 480)

# Plot Line Chart
Sys.setlocale("LC_TIME", "English")
with(t, 
     plot(
         DateTime, 
         Global_active_power, 
         type="n", 
         ylab = "Global Active Power (kilowatts)",
         xlab = ""
     ))
with(t, 
     lines(x=DateTime, y=Global_active_power))

# Close Png
dev.off()

