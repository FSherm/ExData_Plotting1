runplot2 <- function ()
{
    df <- readData()
    x <- setX(df)
    plot2(df, x)
    savePlot2()
    closeAllConnections()
}

plot2 <- function(df, x)
{
    #set up y plot variable
    y <- df$Global_active_power
    
    #plot variables
    plot(x, y, type = "l", ylab = "Global Active Power (kilowats)", xlab = "")
}

#Read in file for Feb 1 & Feb 2nd 2
readData <- function()
{
    library(sqldf)
    df <-
        read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"', sep =
                         ";")
}

#setup x plot variable
setX <- function(df)
{
    #Combines date and time columns
    x <- paste(df$Date, df$Time, sep = ",")
    x <- strptime(x, format = "%d/%m/%Y,%H:%M:%S")
}

savePlot2 <- function()
{
    #Save to png
    dev.copy(png, "plot2.png")
    dev.off()
}