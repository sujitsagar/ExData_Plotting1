data <- read.table('household_power_consumption.txt', header = TRUE, sep=";", na.string = "?" )
data$Date = as.Date( data$Date, format = "%d/%m/%Y" )
data=subset( data, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02") )
data$Time=strptime(paste(as.character(data$Date),as.character(data$Time),sep=" "),format="%Y-%m-%d %H:%M")
for (i in 3:9){ data[,i]=as.numeric(as.character(data[,i])) }
png("Plot2.png",bg="white")
plot(data$Time,data$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="")
dev.off()