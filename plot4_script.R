
##Reading in the data
consumption <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE,
                          header = TRUE,  sep = ";", na.strings = "?")
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption <- tbl_df(consumption)

partial_cons <- subset(consumption, Date >= "2007-02-01" & Date <= "2007-02-02")



##Creating the 2nd plot

png("plot4.png")

par(mfrow = c(2, 2))
par(mar = c(5, 4, 4, 2))

plot(partial_cons$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", main = "", xlab = "",xaxt = "n")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

plot(partial_cons$Voltage, type = "l", 
     ylab = "Voltage", main = "", xlab = "datetime",xaxt = "n")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

plot(partial_cons$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", main = "", xlab = "",xaxt = "n")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
  lines(partial_cons$Sub_metering_2, col = "red")
  lines(partial_cons$Sub_metering_3, col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col = c("black", "red", "blue"), lty = "solid", cex = 0.5, bty = "n")

plot(partial_cons$Global_reactive_power, type = "l", ylab = "Global_reactive_power", 
     xlab = "datetime", xaxt = "n")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()


