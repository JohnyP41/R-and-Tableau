library(shiny)

ui <- fluidPage(
  titlePanel("Moja aplikacja Shiny"),
  sidebarLayout(
    sidebarPanel(
      h1("Instalacja", align = "left"),
      p("Shiny jest dostepny w repozytorium CRAN, wiec mozesz zainstalowac go w zwykly sposob z konsoli R:"),
      code("install.packages(\"shiny\")"),
      br(),
      br(),
      br(),
      br(),
      img(src = "rstudio.png", height = 60, width = 200),
      p("Shiny jest produktem",span("RStudio", style = "color:red"))
      ),
    mainPanel(
      h1("Wprowadzenie do Shiny", align = "left"),
      p("Shiny jest nowym pakietem RStudio, ktory",em("bardzo ulatwia"),"tworzenie interaktywnych aplikacji internetowych w R."),
      br(),
      p("Duzo informacji i przykladow znajduje sie na",a("stronie Shiny."),""),
      br(),
      br(),
      h2("Ficzery"),
      p("-Tworz uzyteczne aplikacje internetowe zaledwie kilkoma liniami kodu - nie jest wymagana znajomosc JavaScriptu"),
      p("-Aplikacje Shiny aktualizuja sie tak samo" ,strong("szybko"),"jak arkusze danych np. Excel. Wyniki zmieniaja sie natychmiast - gdy uzytkownicy modyfikuja dane wejsciowe, nie ma koniecznosci ponownego przeladowania strony.")
    )
  )
)

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)