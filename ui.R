library(shiny)
library(ggplot2)

crimerate <- read.csv("crimerate.csv")

shinyUI(fluidPage(
    titlePanel("FBI Crime Data"),
    sidebarLayout(
        sidebarPanel(
            
            selectInput("state",
                        label = h3("State Names:"),
                        choices = state.name,
                        multiple = TRUE,
                        selectize = TRUE),
            
            sliderInput("dates", 
                        label = h3("Date Range:"),
                        min=1960, max=2012, value=c(1960, 2012)),
            
            selectInput("crimetype",
                               label = h3("Type of Crime:"),
                               choices = names(crimerate)[4:12]),
            
            br(),
            actionButton("goButton", "Create Plot")
            
        ),
        
        mainPanel(
            h1("Documentation"),
            p("This ShinyApp will enable you to compare FBI crime rates for any states in
              the United States from the years 1960-2012. The data come from the ", 
              a("FBI - Uniform Crime Reporting Statistics.", 
                href = "http://www.ucrdatatool.gov/Search/Crime/State/StatebyState.cfm")),
            h3("Instructions:"),
            p("1. Choose the states you would like to compare"),
            p("2. Choose a range of years to compare"),
            p("3. Choose a type of crime"),
            p("4. Click \"Create Plot\""),
            plotOutput("plot1")
        )
    )
))