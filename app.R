#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(reactable)

ui <- dashboardPage(
  dashboardHeader(title = "RNAseq Shiny app"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "Home", icon = icon("home")),
      menuItem("Data Upload", tabName = "DataUpload",icon = icon("download"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "Home",
              fluidRow(
                h2("Home Tab Content")
              )),
      tabItem(tabName = "DataUpload",
              fluidRow(
                box(width = 20,
                    # Input: Select a file ----
                    fileInput("file1", "Choose CSV File for count matrix",
                              multiple = TRUE,
                              accept = c("text/csv",
                                         "text/comma-separated-values,text/plain",
                                         ".csv")),
                    
                    # Horizontal line ----
                    tags$hr(),
                    
                    # Input: Checkbox if file has header ----
                    checkboxInput("header", "Header", TRUE),
                    
                    # Input: Select separator ----
                    radioButtons("sep", "Separator",
                                 choices = c(Comma = ",",
                                             Semicolon = ";",
                                             Tab = "\t"),
                                 selected = ","),
                    
                    # Input: Select quotes ----
                    radioButtons("quote", "Quote",
                                 choices = c(None = "",
                                             "Double Quote" = '"',
                                             "Single Quote" = "'"),
                                 selected = '"'),
                    
                    # Horizontal line ----
                    tags$hr(),
                    reactableOutput("table.count"), )

              ))
    )
  )
)

server <- function(input, output) { }

shinyApp(ui, server)
