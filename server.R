library (tibble)
library(plotly)
library(shiny)
library(dplyr)

server = function(input,output){
  rowChosen = reactive({which(Scenarios_Charts$Scenario == input$Scenario)})
  output$Pie_Chart = renderPlotly(get(Scenarios_Charts[rowChosen(), 2]))
}