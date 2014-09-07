# reading file
EPC <- read.table("household_power_consumption.txt", header = TRUE, colClasses="character", sep=";")
# capturing subset
EPC_1_2_FEB_2007 <- EPC[ which(as.Date(EPC$Date,"%d/%m/%Y")>= as.Date("01/02/2007","%d/%m/%Y") & as.Date(EPC$Date,"%d/%m/%Y") <= as.Date("02/02/2007","%d/%m/%Y")),]
# converting global active power in numeric
EPC_1_2_FEB_2007$Global_active_power <- as.numeric(EPC_1_2_FEB_2007$Global_active_power)
# Generating Histogram for usage of household power
hist(EPC_1_2_FEB_2007$Global_active_power,main="Global Active Power", xlab="Global Active power( in Kilo watts)",ylab="Frequency", col="Red", cex=0.5)
#Saving histogram in to png file
dev.copy(png, file ="plot1.png", width = 480, height = 480)
dev.off()