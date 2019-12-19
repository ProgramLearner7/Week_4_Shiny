library(shiny)
library(dplyr)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$result <- renderText({
        fit = lm(mpg ~ as.numeric(cyl)+disp+wt, data = mtcars)
        input_tbl = data.frame(cyl = as.numeric(input$cyl), disp = input$displacement, wt = input$weight)
        predict(fit, newdata = input_tbl)
        
  })
  
  output$plot = renderPlotly({
          data_select = select(.data = mtcars, mpg, !! input$parameter)
          Selected_parameter = input$parameter
          plot_ly(data_select, x = ~mpg, y = ~get(Selected_parameter)) %>% 
                  add_markers(color = ~get(Selected_parameter)) %>% 
                  layout(yaxis = list(title = "Selected Parameter"))
  })
  
})
