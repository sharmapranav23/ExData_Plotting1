## This function reads a csv file, constructs a plot and stores in plot1.png file  
plot1 <- function(){
    ## first get the big file data
    data <- read.csv("household_power_consumption.txt",sep=";",na.strings=c("?"),colClasses=c("character","character",rep("numeric",7)))
    ## get only the data required for the plot1.R
    subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    ## first convert the strptime representation of time
    subdata$Time <- strptime(paste(subdata$Date,subdata$Time,sep=""),format="%d/%m/%Y %H:%M:%S")
    ## now get the date converted
    subdata$Date <- as.Date(subdata$Date,format="%d/%m/%Y")
    ##start the plotting now
    png(file="plot1.png",width = 480, height = 480,units = "px",bg="white")
    hist(subdata$Global_active_power,xlab = "Global Active Power (kilowatts)",main="Global Active Power",col="red")
    ##close the device
    dev.off()
    
}