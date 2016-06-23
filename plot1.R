download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
unzip("data.zip")
data <- read.csv2("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings = "?", dec = ".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

png("plot1.png")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()