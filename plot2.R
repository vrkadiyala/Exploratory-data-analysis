# reading file
EPC <- read.table("household_power_consumption.txt", header = TRUE, colClasses="character", sep=";")
# capturing subset
EPC_1_2_FEB_2007 <- EPC[ which(as.Date(EPC$Date,"%d/%m/%Y")>= as.Date("01/02/2007","%d/%m/%Y") & as.Date(EPC$Date,"%d/%m/%Y") <= as.Date("02/02/2007","%d/%m/%Y")),]
rm(EPC)
# converting global active power in numeric
EPC_1_2_FEB_2007$Global_active_power <- as.numeric(EPC_1_2_FEB_2007$Global_active_power)
#settign parameters to plot
#par(bg=NA, ps=12)
#plotting
with(EPC_1_2_FEB_2007, plot(strptime(paste(Date, Time),"%d/%m/%Y %H:%M:%S", tz="Europe/Paris"), Global_active_power, type="l",xlab="", ylab="Global active power(in Kilo watts)"))

#Saving histogram in to png file
dev.copy(png, file ="plot2.png", width = 480, height = 480)
dev.off()