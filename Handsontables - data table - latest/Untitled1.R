
library(shinydashboard)
library(shiny)
library(data.table)
library(rhandsontable)

DF = data.frame(num = 1:10, price = 1:10,
                stringsAsFactors = FALSE)

ui = fluidPage(
  titlePanel("sample"),
  fluidRow(box(rHandsontableOutput("hot", height = 400))),
  actionButton("goButton", "Click Me")
)
server = function(input, output) {
  
  observeEvent(input$goButton,{
    print('Change')
  
  
  
  data <- reactiveValues(df=DF)

  output$hot <- renderRHandsontable({
    isolate({
      data$df$total       <- data$df$num*data$df$price
      print(sum(data$df$num*data$df$price) )
    })
    rhandsontable(data$df, selectCallback = TRUE) 
  })
  
    
  })
  
}
shinyApp(ui, server)
    
    