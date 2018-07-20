library(shiny)


server <- function(input, output) {
  
  output$time <- renderPrint({
    invalidateLater(input$num * 1000)
    Sys.time()})
}