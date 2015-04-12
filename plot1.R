DS <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, nrow=69550)
DatesTimes <- paste(DS$Date, DS$Time)
DS$Time <- as.POSIXct(DatesTimes, format="%d/%m/%Y %H:%M:%S")
DS$Date <- as.Date(DS$Date , "%d/%m/%Y")
DS$Global_active_power <- as.numeric(DS$Global_active_power)
DS$Global_reactive_power <- as.numeric(DS$Global_reactive_power)
DS$Sub_metering_1 <- as.numeric(DS$Sub_metering_1)
DS$Sub_metering_2 <- as.numeric(DS$Sub_metering_2)
DS$Sub_metering_3 <- as.numeric(DS$Sub_metering_3)
DS2 <- DS[(DS$Date >= '2007-02-01') & (DS$Date <= '2007-02-02'),]

png("plot1.png", bg = "transparent", width=480, height=480)
hist(DS2$Global_active_power, breaks=12, 
        main="Global Active Power", 
        xlab="Global Active Power (kilowatts)", col='Red')
dev.off()
