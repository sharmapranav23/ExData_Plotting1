## This function reads a csv file, constructs a plot and stores in plot2.png file  
plot2 <- function(){
    ## first get the big file data
    data <- read.csv("household_power_consumption.txt",sep=";",na.strings=c("?"),colClasses=c("character","character",rep("numeric",7)))
    ## get only the data required for the plot1.R
    subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    ## now first convert the strptime representation of time
    subdata$Time <- as.POSIXct(strptime(paste(subdata$Date,subdata$Time,sep=""),format="%d/%m/%Y %H:%M:%S"))
    ## now get the date converted
    subdata$Date <- as.Date(subdata$Date,format="%d/%m/%Y")
    ##start the plotting now
    png(file="plot2.png",width = 480, height = 480,units = "px",bg="white")
    plot(subdata$Time,subdata$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()
    
}