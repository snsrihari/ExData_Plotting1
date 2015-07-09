plot1 <- function(){
    cn <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
    power_cons <- read.table("./household_power_consumption.txt",sep=";",col.names=cn,skip = 1)
    power_cons$upd_date <- as.Date(power_cons$Date,"%d/%m/%Y")
    reqs_list <- power_cons[power_cons$upd_date >= "2007-02-01",]
    reqs_list <- reqs_list[reqs_list$upd_date < "2007-02-03",]
    histfe <- reqs_list$Global_active_power
    his<-as.vector(histfe, mode = "any")
    hist(as.numeric(his),col="Red")
    dev.copy(png,file="plot1.png")
    
}