plot4 <- function() {
    
    source("plot2.R")
    source("plot3.R")
    
    df <- readData()
    x <- setX(df)

    
    #setup grid for 4 graphs
    par(mfcol = c(2,2))
    
    #plot first two graphs
    plot2(df, x)
    plot3(df, x)
        
    #setup plot 3 & 4 y variable
    y3 <- df$Voltage
    y4 <- df$Global_reactive_power
    
    #plot 3 & 4
    plot(x, y3, type = "l", xlab = "datetime", ylab = "voltage")
    plot(x, y4, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
    
    #Save to png
    dev.copy(png, "plot4.png")
    dev.off()
    closeAllConnections()
    
}