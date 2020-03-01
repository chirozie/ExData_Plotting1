## read data
household_power <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, 
                              header = TRUE, sep =";"  )
#renaming the colums
names(household_power) <- c("Date","Time","Global_active_power","Global_reactive_power",
                            "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


## Create column in table with date and time merged together
FullTimeDate <- strptime(paste(household_power$Date, household_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
household_power <- cbind(household_power, FullTimeDate)

## change class of columns to correct class
household_power$Date <- as.Date(household_power$Date, format="%d/%m/%Y")
household_power$Time <- format(household_power$Time, format="%H:%M:%S")
household_power$Global_active_power <- as.numeric(household_power$Global_active_power)
household_power$Global_reactive_power <- as.numeric(household_power$Global_reactive_power)
household_power$Voltage <- as.numeric(household_power$Voltage)
household_power$Global_intensity <- as.numeric(household_power$Global_intensity)
household_power$Sub_metering_1 <- as.numeric(household_power$Sub_metering_1)
household_power$Sub_metering_2 <- as.numeric(household_power$Sub_metering_2)
household_power$Sub_metering_3 <- as.numeric(household_power$Sub_metering_3)

## subset data from 2007-02-01 and 2007-02-02
household_power2 <- subset(household_power, Date == "2007-02-01" | Date =="2007-02-02")

#plotting and annotating the graph
with(household_power2, plot(FullTimeDate, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(household_power2$FullTimeDate, household_power2$Sub_metering_2,type="l", col= "red")
lines(household_power2$FullTimeDate, household_power2$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty= 1, lwd=2, col = c("black", "red", "blue"))
