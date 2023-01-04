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
      textOutput("selected_var"),
      textOutput("var")
    )
  )
)

server <- function(input, output) {
  
  output$selected_var <- renderText({
    paste("Zaznaczyles opcje:", input$select)
  })
  
  output$var <- renderText({
    paste("Wybrales zakres od", input$slider1[1], "do ",input$slider1[2])
  })
}

shinyApp(ui = ui, server = server)