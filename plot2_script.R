
##Reading in the data
consumption <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE,
                          header = TRUE,  sep = ";", na.strings = "?")
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption <- tbl_df(consumption)

partial_cons <- subset(consumption, Date >= "2007-02-01" & Date <= "2007-02-02")



##Creating the 2nd plot

png("plot2.png")
plot(partial_cons$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", main = "", xlab = "",xaxt = "n")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()


