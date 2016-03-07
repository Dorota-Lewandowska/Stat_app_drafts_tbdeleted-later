library(shinydashboard)
library(shiny)
library(data.table)
library(rhandsontable)
library(shinyjs)



MAT1<-data.frame(matrix(NA, nrow=10, ncol=5))
names(MAT1)<-c("des", " p1" , "n1", "p2", "n2")


MAT1[,1]<-as.character(MAT1[,1])
MAT1[,2]<-as.numeric(MAT1[,2])
MAT1[,4]<-as.numeric(MAT1[,4])
MAT1[,3]<-as.integer(MAT1[,3])
MAT1[,5]<-as.integer(MAT1[,5])


MAT2<-data.frame(matrix(NA, nrow=10, ncol=10))
names(MAT2)<-c("des", " p1" , "n1", "p2", "n2", "s90", "s95", "s99","zscore", "pval")





##z-score calculator
z_function<-function(a,b,c,d){
  a<-a/100
  c<-c/100
  z<-(a-c)/sqrt((a*(1-a))/b+(c*(1-c))/d)
  return(z)
}

server = function(input, output, session) {
  
  
  data1 <- reactiveValues(df=MAT1)
  data2 <- reactiveValues(df=MAT2)
  

  

  
  output$hot <- renderRHandsontable({
    rhandsontable(data1$df, selectCallback = TRUE, rowHeaders=NULL, width = 550, height = 300, manualColumnMove=TRUE,
                  manualRowName=TRUE) %>%
      hot_col(col = "n1", format = "'0,0'") 
    #%>% hot_cols(renderer = "function (instance, td, row, col, prop, value, cellProperties) {
               #Handsontable.renderers.TextRenderer.apply(this, arguments);
               #td.style.background = 'lightgrey';

#}")

  })
  

observeEvent(input$goButton, {
  enable("downloadData")
  
  
  output$hot1 <- renderRHandsontable({
    rhandsontable(data2$df, selectCallback = TRUE, rowHeaders=NULL, width = 550, height = 300, manualColumnMove=TRUE,
                  manualRowName=TRUE) %>%
      hot_col(col = "n1", format = "'0,0'") 
    #%>% hot_cols(renderer = "function (instance, td, row, col, prop, value, cellProperties) {
    #Handsontable.renderers.TextRenderer.apply(this, arguments);
    #td.style.background = 'lightgrey';
    
    #}")
    
  })
  
})

  
}

