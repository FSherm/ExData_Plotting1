plot1 <- function() {
    #Read in file for Feb 1 & Feb 2nd 2
    
    filename <- "household_power_consumption.txt"
    library(sqldf)
    df <-
        read.csv.sql(filename, sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"', sep =
                         ";")
    close(file(filename))
    
    #plot histogram
    hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowats)", main = "Global Active Power")
    
    #Save to plot1.png
    dev.copy(png, "plot1.png")
    dev.off()
    closeAllConnections()
   
}