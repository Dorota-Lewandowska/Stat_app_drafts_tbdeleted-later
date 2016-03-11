library(shinydashboard)
library(shiny)
library(data.table)
library(rhandsontable)

##create an initial data frame
DF = data.frame(Description = rep(as.character(""),20), g1_p = rep(0,20),g1_n = rep(0,20),g2_p = rep(0,20),
                g2_n = rep(0,20),  stringsAsFactors = FALSE)




##z-score calculator
z_function<-function(a,b,c,d){
  a<-a/100
  c<-c/100
  z<-(a-c)/sqrt((a*(1-a))/b+(c*(1-c))/d)
  return(z)
}

server = function(input, output) {
  
  
  data <- reactiveValues(df=DF)
  
  output$hot <- renderRHandsontable({
    isolate({
      data$df$z_score <- z_function(a=data$df$g1_p, b=data$df$g1_n, c=data$df$g2_p, d=data$df$g2_n)
      print(z_function(a=data$df$g1_p, b=data$df$g1_n, c=data$df$g2_p, d=data$df$g2_n))  
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
    
    print(new.v)
    
    
    # Save and update the value
    data$df[row.i,col.i] <- new.v
    
  })
  

  
  

  
}

