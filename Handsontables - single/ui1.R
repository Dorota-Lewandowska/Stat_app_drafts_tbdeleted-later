
library(shinydashboard)
library(shiny)
library(data.table)
library(rhandsontable)




ui = fluidPage(
  titlePanel("Calculator indep samples"),
  fluidRow(box(rHandsontableOutput("hot")))  
)



