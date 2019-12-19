library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Motor Trend Car Road Tests Data"),
  h4("The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models)."),
  h4("The purpose of this analysis is to predict miles per gallon based on three parameters (i.e. cylinders, weight and displacement) using a linear regression model in the Tab 1. The Tab 2 shows a scatter plot of mpg and a selected parameter."),
  
  tabsetPanel(
          tabPanel("Tab 1", 
           # Sidebar with a slider input for number of bins 
                  sidebarLayout(
                    sidebarPanel(
                            selectInput("cyl",
                                   "Step 1: Choose the number of cylinders",
                                   choices = list("4", "6", "8")),
                            sliderInput("weight",
                                        "Step 2: Choose a weight value (1000 lbs)",
                                        min = 1, max = 6, value = 3, step = 0.1),
                            sliderInput("displacement",
                                        "Step 3: Choose a displacement value (cu.in.)",
                                        min = 70, max = 500, step = 10, value = 230),
                            submitButton(text = "Apply Changes")
                    ),
                    
                    # Show a plot of the generated distribution
                    mainPanel(
                            h5("The mile per gallon based on your selection is "),
                            textOutput("result")
                    )
                  )
           ),
         tabPanel("Tab 2", 
                  sidebarLayout(
                          sidebarPanel(
                                  selectInput("parameter", 
                                              "Select a parameter to show its relationship with mpg",
                                              c("Cylinders" = "cyl",
                                                "Weight (1000 lbs)" = "wt",
                                                "Displacement (cu.in.)" = "disp")
                                              ),
                                  submitButton(text = "Apply Changes")
                          ),
                          mainPanel(
                                  plotlyOutput("plot")
                                  # tableOutput("tbl"),
                                  # textOutput("param")
                          )
                  )
                  )
)))
