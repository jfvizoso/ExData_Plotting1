download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
unzip("data.zip")
data <- read.csv2("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings = "?", dec = ".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
data$DateTime <- strptime(paste(data$Date,data$Time), format="%Y-%m-%d %T", tz="GMT")
Sys.setlocale("LC_TIME", "English")

png("plot4.png")
par(mfrow=c(2,2))
with(data, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power", xlab=""))

with(data, plot(DateTime, Voltage, type="l", ylab="Voltage", xlab=""))

with(data, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub mettering", xlab="", col="black"))
with(data, lines(DateTime, Sub_metering_2, type="l", col="red"))
with(data, lines(DateTime, Sub_metering_3, type="l", col="blue"))
legend(col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_1"), x="topright", lty=c(1,1),  bty="n")

with(data, plot(DateTime, Global_reactive_power, type="l", xlab="datetime"))

dev.off()