library(shinydashboard)
library(shinydashboardPlus)
library(shinySearchbar)

tags$head(
  tags$link(rel = "stylesheet", type = "text/css", href = "MainCss.css")
)

#---------Header Section Start----------------#
head <- dashboardHeader(title = "Appsilon",
                        #dropdownMenu(type = "messages"),
                        dropdownMenu(type = "notification")
                        #dropdownMenu(type = "task")
)
#---------Header Section End----------------#


#---------Sidebar Section Start----------------#
sidebar <- dashboardSidebar(
  # sidebarSearchForm(label = "Search mer", "searchText", "searchButton",icon = shiny::icon("search")),
  
  sidebarMenu(style = " overflow-y: auto;", id = "tabs",
              menuItem("Dashboard", tabName = "dashboard")
  )
  
)


bodys <- dashboardBody(
  fluidPage(
    fluidRow( class= "searchbar",
      searchbar( inputId = "searchbar", contextId = "searchbar",placeholder =  "Search",width = '100%'),
      
      actionButton("btn_sub","Click Me")
    ),
    fluidRow(
      box(solidHeader = TRUE, 
          title = "Data",
          #textOutput("hii"),
          dataTableOutput("tadms")
      ),
      
      
      box( height = '100%',
           title = "Graph",
         plotOutput("myplot")
            
      )
    )
)
)

#---------Body Section End----------------#

ui <- dashboardPage( skin = 'purple',
                     head,
                     sidebar,
                     bodys,
                     footer = dashboardFooter(left = "By Amit Mehta")
)