#read the data into R
household_power_consumption <- read.csv("~/R/exdata_data_household_power_consumption/household_power_consumption.txt", header=FALSE, sep=";")
#have a look at the top 6 rows of the dataset
head(household_power_consumption)
#give names to each column in the dataset
names(household_power_consumption) <- c("date","time","global_active_power","global_reactive_power","voltage","global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")
#subset of the entire data
subdata <- subset(household_power_consumption, household_power_consumption$date == "1/2/2007" |  household_power_consumption$date == "2/2/2007")

#Transformation of the Date and Time
subdata$date <- as.Date(subdata$date, format="%d/%m/%Y")
subdata$time <- strptime(subdata$time, format="%H:%M:%S")
subdata[1:1440,"time"] <- format(subdata[1:1440,"time"],"2007-02-01 %H:%M:%S")
subdata[1441:2880,"time"] <- format(subdata[1441:2880,"time"],"2007-02-02 %H:%M:%S")

#make second figure
plot(subdata$time,as.numeric(subdata$global_active_power),type="l", xlab="", ylab="Global Active Power (kilowatts)") 
title(main = "Global Active Power vs Time")










