#loading required packages
library(data.table)
library(dplyr)

#Reading the dataset into R
household_power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
#Renaming the columns
names(household_power) <- c("Date","Time","Global_active_power","Global_reactive_power",
                            "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                            "Sub_metering_3")
#subsetting the required rows for the 2 days
household_power2 <- subset(household_power, 
                           household_power$Date == "1/2/2007" | household_power$Date == "2/2/2007")
#converting Global_active_power to numeric vector
household_power2$Global_active_power <- as.numeric(household_power2$Global_active_power)

#calling the base plot function
hist(household_power2$Global_active_power, col="orange red",main="Global Active Power",
     xlab="Global Active Power(kilowatts)")