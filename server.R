library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(grid)
library(tools)
library(plotly)
library(ggh4x)
library(reshape2)
library(rio)
library(readxl)
library(lubridate)



source("AllFun.R", local = TRUE)


server <- function(input, output, session) {
  
  
  #reactive({output$tadms <- renderDataTable(Sp_dataset())})
  
  observeEvent(input$btn_sub, {
   output$tadms <- renderDataTable(disp_data())
   output$myplot <- renderPlot(myplot())
  })
}
