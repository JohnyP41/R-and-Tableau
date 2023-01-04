library(shiny)

ui <- fluidPage(
  titlePanel("Spis powszechny"),
  sidebarLayout(
    sidebarPanel(
      helpText("Stworz mapy demograficzne za pomoca informacji ze spisu powszechnego USA w 2010 r."),
      strong("Wybierz zmienna do"),
      br(),
      strong("wyswietlania"),
      selectInput("select",strong(),choices = list("Procent ludnosci bialej", "Procent Afroamerykanow","Procent Latynosow","Procent Azjatow"), selected = "Procent ludnosci bialej"),
      sliderInput("slider1", strong("Zakres:"),min = 0, max = 100, value = c(0,100))
    ),
    
    mainPanel(
  
    )
  )
)

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)