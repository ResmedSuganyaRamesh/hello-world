
library(shiny)


server <- function(input, output) {
  
  rv <- reactiveValues(data = rnorm(50))
  
  observeEvent(input$normData, {rv$data <- rnorm(input$num)})
  observeEvent(input$uniData, {rv$data <- runif(input$num)})
  
  output$hist <- renderPlot({hist(rv$data)})
  output$verbatim <- renderPrint({summary(rv$data)})
}
