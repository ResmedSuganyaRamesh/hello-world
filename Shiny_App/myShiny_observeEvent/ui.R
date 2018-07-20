library("shiny")

ui <- fluidPage(
  
  sliderInput(inputId = "num", label = "choose a number", min = 0, max = 100, value = 50),
  actionButton(inputId = "normData", label = "Normal Data"),
  actionButton(inputId = "uniData", label = "Uniform Data"),
  plotOutput(outputId = "hist"),
  verbatimTextOutput(outputId = "verbatim")
)
