library(shiny)
library(ggplot2)

crimerate <- read.csv("crimerate.csv")


shinyServer(function(input, output) {

    output$plot1 <- renderPlot({
        if(input$goButton == 0)
            return()
        
        crimerate <- crimerate[which(crimerate$State %in% input$state),]
        crimerate <- crimerate[which(crimerate$Year >= input$dates[1]),]
        crimerate <- crimerate[which(crimerate$Year <= input$dates[2]),]
        crimerate <- crimerate[, c(1,2, which(names(crimerate) == input$crimetype))]
        names(crimerate)[3] <- "Crimetype"
        
        p <- ggplot(crimerate, aes(x = Year, y = Crimetype, group = State, colour = State)) + 
            geom_line() +
            ggtitle("State Comparison") +
            ylab(input$crimetype) +
            theme(axis.title.x=element_text(size=16), 
                  axis.title.y=element_text(size=16),
                  title=element_text(size=20))
        print(p)
    })
})