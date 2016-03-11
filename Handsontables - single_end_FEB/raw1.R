
library(shinydashboard)
library(shiny)
library(data.table)
library(rhandsontable)

DF = data.frame(num = 1:10, price = 1:10,
                stringsAsFactors = FALSE)
DF = rbind(DF, c(0,0,0))

ui = fluidPage(
  titlePanel("sample"),
  fluidRow(box(rHandsontableOutput("hot", height = 400)))  
)
server = function(input, output) {
  data <- reactiveValues(df=DF)
  
  output$hot <- renderRHandsontable({
    isolate({
      data$df$total       <- data$df$num*data$df$price
      print(sum(data$df$num*data$df$price) )
      data$df$total[11]   <- sum(data$df$num*data$df$price) 
    })
    rhandsontable(data$df, selectCallback = TRUE) 
  })
  
  observeEvent(input$hot$changes,{
    print('Change')
    
    # Get changed value
    row.i <- input$hot_select$select$r
    col.i <- input$hot_select$select$c
    new.v <- unlist( input$hot$changes$changes )
    new.v <- new.v[[length(new.v)]]
    
    # Save and update the value
    data$df[row.i,col.i] <- new.v
    data$df$total <- data$df$num[row.i]*data$df$price[row.i]
    
    # Calculate Sum 
    data$df$total[11] <- sum(data$df$total)
  })
  
}
shinyApp(ui, server)

  



!!!!!!!!!!!
  GOOD ONE
!!!!!!!!!!!

=========
  OLD
==================
  
  shinyServer(function(session, input, output) {
    
    output$hot = renderRHandsontable({
      
      
      
      
      DF<-data.frame(matrix(NA, nrow=1000, ncol=10))
      names(DF)<-c("Description", " Sample1_perc" , "Sample1_size", "Sample2_%", "Sample2_size", "ninety", "95%", "99%", "z-score", "p-value")
      
      
      DF[,1]<-as.character(DF[,1])
      DF[,2]<-as.numeric(DF[,2])
      DF[,4]<-as.numeric(DF[,4])
      DF[,3]<-as.integer(DF[,3])
      DF[,5]<-as.integer(DF[,5]) 
      
      DF<-as.data.frame(DF) 
      
      
      #for rows in 
      #if(DF$Description ==1){
      #DF$ninety ="blabla"
      #}
      #else{
      #DF$ninety=""
      #}
      
      DF$ninety<-DF$Description
      
      
      rhandsontable(DF)
      
    })
  })


=======
  OLD2
======
  observeEvent(input$hot$changes,{
    print('Change')
    
    # Get changed value
    row.i <- input$hot_select$select$r
    col.i <- input$hot_select$select$c
    new.v <- unlist( input$hot$changes$changes )
    new.v <- new.v[[length(new.v)]]
    
    # Save and update the value
    data$df[row.i,col.i] <- new.v
    data$df$total <- data$df$num[row.i]*data$df$price[row.i]
    
    # Calculate Sum 
    data$df$total[11] <- sum(data$df$total)
  })
