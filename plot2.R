
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

## subset data from 2007-02-01 and 2007-02-02
household_power2 <- subset(household_power, Date == "2007-02-01" | Date =="2007-02-02")

## plot globalactivepower vs date&time
with(household_power2, plot(FullTimeDate, Global_active_power, type="l", xlab="Day",
                      ylab="Global Active Power (kilowatts)"),)
                      