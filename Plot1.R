#loading required packages
library(dplyr)
library(data.table)

#reading the dataset into R
household_power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
#renaiming the columsn
names(household_power) <- c("Date","Time","Global_active_power","Global_reactive_power",
                            "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subsetting the data for the required 2 days
household_power2 <- subset(household_power, 
                           household_power$Date == "1/2/2007" | household_power$Date == "2/2/2007" )

#plotting the histogram
hist(as.numeric(as.character(household_power2$Global_active_power)),col="orange red",
     main="Global Active Power",xlab="Global Active Power(kilowatts)")