library("shiny")

ui <- fluidPage(
  sliderInput(inputId = "num", label = "Time Delay", min = 0, max = 10, value = 5),
  verbatimTextOutput(outputId = "time")
)

