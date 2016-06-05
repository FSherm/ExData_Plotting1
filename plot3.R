runplot3 <- function()
{
    source("plot2.R")
    df <- readData()
    x <- setX(df)
    plot3(df, x)
    savePlot3()
    closeAllConnections()
}

plot3 <- function(df, x)
{
    #set up y plot variables
    y1 <- df$Sub_metering_1
    y2 <- df$Sub_metering_2
    y3 <- df$Sub_metering_3
    
    #plot variables
    plot(x, y1, type = "n", xlab = "", ylab = "Energy Sub metering")
    points(x, y1, type = "l")
    points(x, y2, type = "l", col = "red")
    points(x, y3, type = "l", col = "blue")
    
    #add legend
    legend(
        "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd = c(1,1,1), col = c("black", "red", "blue")
    )
}

savePlot3 <- function()
{
    #Save to png
    dev.copy(png, "plot3.png")
    dev.off()
}