## This function reads a csv file and constructs 4 plots 
## and stores all 4 plots in one device area inside plot4.png file
plot4 <- function(){
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
    png(file="plot4.png",width = 480, height = 480,units = "px",bg="white")
    ## png file is prepared, start the ploting
    par(mfrow=c(2,2))
    with(subdata,{
        ##plot - row 1, column 1
        plot(Time,Global_active_power,type="l",xlab="", ylab="Global Active Power")
        ## plot- row 1, column 2
        plot(Time,Voltage,type="l",xlab="datetime", ylab="Voltage")
        ## plot- row 2, column 1
        plot(Time,Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
        lines(subdata$Time,subdata$Sub_metering_2,col="red")
        lines(subdata$Time,subdata$Sub_metering_3,col="blue")
        legend("topright",lty=1,col=c("black","red","blue"),legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
        ## plot- row 2, column 2
        plot(Time,Global_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power")
        
    })
    dev.off()
    
}