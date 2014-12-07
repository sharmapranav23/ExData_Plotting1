## This function reads a csv file, constructs a plot and stores in plot3.png file
plot3 <- function(){
    ## first get the big file data
    data <- read.csv("household_power_consumption.txt",sep=";",na.strings=c("?"),colClasses=c("character","character",rep("numeric",7)))
    ## get only the data required for the plot1.R
    subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    ## now first convert the strptime representation of time
    ##subdata$Time <- strptime(paste(subdata$Date,subdata$Time,sep=""),format="%d/%m/%Y %H:%M:%S")
    subdata$Time <- as.POSIXct(strptime(paste(subdata$Date,subdata$Time,sep=""),format="%d/%m/%Y %H:%M:%S"))
    ## now get the date converted
    subdata$Date <- as.Date(subdata$Date,format="%d/%m/%Y")
    ##start the plotting now
    png(file="plot3.png",width = 480, height = 480,units = "px",bg="white")
    plot(subdata$Time,subdata$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
    lines(subdata$Time,subdata$Sub_metering_2,col="red")
    lines(subdata$Time,subdata$Sub_metering_3,col="blue")
    legend("topright",lty=1,col=c("black","red","blue"),legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
    dev.off()
    
}