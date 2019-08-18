
##Reading in the data
consumption <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE,
                      header = TRUE,  sep = ";", na.strings = "?")
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption <- tbl_df(consumption)

partial_cons <- subset(consumption, Date >= "2007-02-01" & Date <= "2007-02-02")



##Creating the 1st plot

png("plot1.png")
hist(partial_cons$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()


