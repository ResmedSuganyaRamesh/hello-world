library(shiny)
library(maps)
library(mapproj)
counties <- readRDS("data/counties.rds")
source("helpers.R")

ui <- fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
    sidebarPanel(
      
      helpText("Create demographic maps with information from the 2010 US Census"),
      
      selectInput("var", h4("choose a variable to display"),
                  choices = list("Percent White", "Percent Black",
                                 "Percent Hispanic", "Percent Asian")),
     
       sliderInput("range", h4("Range of interest"), 
                  min = 0, max = 100, value = c(0, 100))
      
    ),
    
    mainPanel(
      textOutput(outputId = "selected_var"),
      textOutput(outputId = "selected_slider"),
      plotOutput(outputId = "map")
    )
  )
  
)

server <- function(input, output){
  
  
  
  # output$selected_var <- renderText({
  #   paste("You have selected", input$var)
  # })
  # 
  # output$selected_slider <- renderText({
  #   paste("You have chosen a range from", input$range[1], "and", input$range[2])
  # })
  
  output$map <- renderPlot({
    args <- switch(input$var,
                   "Percent White" = list(counties$white, "darkgreen", "% White"),
                   "Percent Black" = list(counties$black, "black", "% Black"),
                   "Percent Hispanic" = list(counties$hispanic, "darkorange", "% Hispanic"),
                   "Percent Asian" = list(counties$asian, "darkviolet", "% Asian"))
    
    args$min <- input$range[1]
    args$max <- input$range[2]
    
    do.call(percent_map, args)
  })

}

shinyApp(ui, server)