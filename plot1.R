setwd("C:/Users/mmakhani/Dropbox/QUEST/Data_Science_Coursework/Course4_Exploratory/assignment1")

#download data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
              , "hh_power_consumption.zip")
unzip("hh_power_consumption.zip")

#save the subset data into main variable
dat <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
dat2 <- dat[dat$Date=="1/2/2007" | dat$Date=="2/2/2007",]

#convert date/time variables
dt <- as.POSIXct(paste(as.Date(dat2$Date,"%d/%m/%Y"),dat2$Time),format="%Y-%m-%d %H:%M:%S")
dat3 <- data.frame(dat2,dt)

#convert relevant variables to numeric
dat4_nums <- sapply(lapply(dat3[,3:9],as.character),as.double)
dat5 <- data.frame(dat4_nums,dat3$dt)

#plot 1
png("plot1.png")
hist(dat5$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()
