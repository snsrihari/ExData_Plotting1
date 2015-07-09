plot3 <- function(){
    cn <- c("Date","Time","Global_active_power","Global_reactive_power",
            "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
    power_cons <- read.table("./household_power_consumption.txt.mod",sep=";",
                             col.names=cn,skip = 1)
    power_cons$upd_date <- as.Date(power_cons$Date,"%d/%m/%Y")
    power_cons$week_day <- format(power_cons$upd_date,"%a")
    
    reqs_list <- power_cons[power_cons$upd_date >= "2007-02-01",]
    reqs_list <- reqs_list[reqs_list$upd_date < "2007-02-03",]
    dateTime <- as.POSIXlt(paste(power_cons$upd_date, power_cons$Time, sep=" "))
    histfe <- reqs_list$Global_active_power
    his<-as.vector(histfe, mode = "any")
    png(file="plot3.png",width=480,height=480)
    
    plot(dateTime,reqs_list$Sub_metering_1,type="o",col="black",pch="",
         ylab="Energy sub metering",xlab="")
    lines(dateTime,reqs_list$Sub_metering_2,type="o",col="red",pch="")
    lines(dateTime,reqs_list$Sub_metering_3,type="o",col="blue",pch="")
    legend("topright", pch = "", col = c("black", "red","blue"), lwd=c(1,1),
           legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    dev.off()
}
