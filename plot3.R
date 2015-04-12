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

png("plot3.png", bg = "transparent", width=480, height=480)

plot(DS2$Sub_metering_1, type="n", main="", xlab="",
        ylab="Energy sub metering", xaxt="n")
axis(side=1, at=c(1, nrow(DS2)/2, nrow(DS2)), labels=c("Thu", "Fri", "Sat"))
lines(DS2$Sub_metering_1, col='Black')
lines(DS2$Sub_metering_2, col='Red')
lines(DS2$Sub_metering_3, col='Blue')
legend("topright", legend=colnames(DS2)[7:9], lwd=1, col=c('Black', 'Red', 'Blue'))

dev.off()
