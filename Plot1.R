ds <- read.table('1.txt', header = TRUE, sep=";", na.string = "?" )
ds$Date = as.Date( ds$Date, format = "%d/%m/%Y" )
data=subset(ds, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

data$Time=strptime(paste(as.character(data$Date),as.character(data$Time),sep=" "),format="%Y-%m-%d %H:%M")

for (i in 3:9){ data[,i]=as.numeric(as.character(data[,i])) }

png("Plot1.png",bg="white")
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()