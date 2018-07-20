library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel("My Shiny App"),
  
  sidebarLayout(
    sidebarPanel("sidebar panel"),
    mainPanel(
      p("This create a paragraph."),
      p("A new p() command starts a new paragraph. Supply a style attribute to change the format of the entire paragraph.",
        style = "font-family: 'times'; font-si16pt"),
      
      strong("strong() makes bold test"),
      em("em() creates italicized text"),
      br(),
      
      code("code() displays your text in computer code"),
      div("div creates segments of text with a similar style. 
          This division of text is all blue because I passed the argument 'style = color:blue' to div", style = "color:blue"),
      br(),
      
      p("span() does  the same thing as div, but it worls with", span("groups of words", style = "color:blue"),
        "that is inside a paragraph"),
      br(),
      
###The img function looks for your image file in a specific place. Your file must be in a folder named www in the same directory as the app.R script.
      img(src = "rstudio.png", height = 100, width = 200)
    )
  )
  
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)