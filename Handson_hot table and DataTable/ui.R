
library(shinydashboard)
library(shiny)
library(data.table)
library(rhandsontable)
library(shinyjs)



#DF<-data.frame(matrix(NA, nrow=1000, ncol=5))
#names(DF)<-c("Description", " p_1" , "n_1", "p_2", "n_2")






#ui = fluidPage(
  #titlePanel("Calculator indep samples"),
  #fluidRow(box(rHandsontableOutput("hot")))  
#)

shinyUI(fluidPage(
  titlePanel("Calculator - % diff independent samples"),
  fluidRow(
    column(3,
           helpText("Insert your data here"),
           rHandsontableOutput("hot")

    ),
    column(3,
           useShinyjs(),
           actionButton("goButton", "Generate report"),
           disabled(downloadButton('downloadData', 'Download'))
           
    ),

    column(3,
           helpText("Calculations"),
           rHandsontableOutput("hot1")
    ),
    column(3,
           
           tags$img(height=30, width=91, 
                    src = "http://cdn.yougov.com/cumulus_uploads/document/0poe1ldz80/10%20YouGov%20with%20Brand%20Line%20(Vertical).png")
    )
  )
))

