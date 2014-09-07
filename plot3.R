# reading file
EPC <- read.csv2("household_power_consumption.txt", header = TRUE, sep=";")
# capturing subset
EPC_1_2_FEB_2007 <- EPC[ which(as.Date(EPC$Date,"%d/%m/%Y")>= as.Date("01/02/2007","%d/%m/%Y") & as.Date(EPC$Date,"%d/%m/%Y") <= as.Date("02/02/2007","%d/%m/%Y")),]
rm(EPC)
# converting global active power in numeric
#EPC_1_2_FEB_2007$Global_active_power <- as.numeric(EPC_1_2_FEB_2007$Global_active_power)
#settign parameters to plot
par(mar = c(2,4,2,2)) # bg=NA, ps=12)
#plotting
with(EPC_1_2_FEB_2007, plot(strptime(paste(Date, Time),"%d/%m/%Y %H:%M:%S",tz="Europe/Paris"), as.numeric(Sub_metering_1), type="n",xlab="", ylab="Energy sub metering"))
with(EPC_1_2_FEB_2007,lines(strptime(paste(Date, Time),"%d/%m/%Y %H:%M:%S",tz="Europe/Paris"), as.numeric(Sub_metering_1), col="black"))
with(EPC_1_2_FEB_2007,lines(strptime(paste(Date, Time),"%d/%m/%Y %H:%M:%S",tz="Europe/Paris"), as.numeric(Sub_metering_2), col="red"))
with(EPC_1_2_FEB_2007,lines(strptime(paste(Date, Time),"%d/%m/%Y %H:%M:%S",tz="Europe/Paris"), as.numeric(Sub_metering_3), col="blue"))
legend("topright",lty = c(1,1,1),col =c("black","red","blue"), legend =c("sub_metering_1","sub_metering_2","sub_metering_3"))
#Saving histogram in to png file
dev.copy(png, file ="plot3.png", width = 480, height = 480)
dev.off()