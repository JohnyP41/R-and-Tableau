library(shiny)
library(ggplot2)
ui <- fluidPage(
  titlePanel("Ovarian tumor risk of malignancy index calculator (IOTA LR2)"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("slider1", strong("Age of the patient (years):"),min = 14, max = 100, value = 40),
      selectInput("select1",strong("Presence of ascites:"),choices = list("no"=0,"yes"=1),selected=0),
      selectInput("select2",strong("Presence of blood flow within a papillary projection:"),choices = list("no"=0,"yes"=1),selected=0),
      sliderInput("slider2", strong("Largest diameter of the solid component (in mm):"),min = 0, max = 200, value = 0),
      selectInput("select3",strong("Irregular internal cyst wall:"),choices = list("no"=0,"yes"=1),selected=0),
      selectInput("select4",strong("Presence of acoustic shadows::"),choices = list("no"=0,"yes"=1),selected=0),
      actionButton("update" ,"Calculate")
    ),
    
    mainPanel(
      p("This application is designed for gynaecologists and implements ovarian tumor risk malignancy index based on IOTA LR2 algorithm. It also visualises an output of the logistic regression."),
      p("For a detailed description of the algorithm please refer to the paper: Timmerman D, Testa AC, Bourne T, [et al.]. Logistic regression model to distinguish between the benign and malignant adnexal mass before surgery: a multicenter study by the International Ovarian Tumor Analysis Group. J Clin Oncol. 2005, 23, 8794-8801."),
      h1("Malignancy prediction algorithm"),
      p("In general, LR2 algorithm predicts a tumor as a benign when a patient is young, a solid component of lesion is small and acoustic shadows are present. You may check it empirically by different combinations of input values."),
      p("Fill in the form and click",strong("Calculate")," button."),
      
      htmlOutput("selected_var"),
      htmlOutput("var"),
      br(),
      plotOutput("wykres")
    )
  )
)

server <- function(input, output, session) {

  output$selected_var <- renderText({
    input$update
    p=0
    if(as.numeric(isolate(input$slider2))>=50){
      p=50
    }
    z=-5.3718+0.0354*as.numeric(isolate(input$slider1))+1.6159*as.numeric(isolate(input$select1))+1.1768*as.numeric(isolate(input$select2))+0.0697*p+0.9586*as.numeric(isolate(input$select3))-2.9486*as.numeric(isolate(input$select4))
    x=round(1/(1+exp(-z)),3)
    if(as.numeric(input$update)>0){
      paste("Raw predictor value (the lower, the better): ", strong(x))
    }
  })
  
  output$var <- renderText({
    input$update
    p=0
    if(as.numeric(isolate(input$slider2))>=50){
      p=50
    }
    z=-5.3718+0.0354*as.numeric(isolate(input$slider1))+1.6159*as.numeric(isolate(input$select1))+1.1768*as.numeric(isolate(input$select2))+0.0697*p+0.9586*as.numeric(isolate(input$select3))-2.9486*as.numeric(isolate(input$select4))
    x=round(1/(1+exp(-z)),3)
    if(as.numeric(input$update)>0){
    if(x>0.1){
      paste("Class of the tumor: ",strong("malignant"))
    } else {
      paste("Class of the tumor: ",strong("benign"))
    }
    }
  })
  
  output$wykres <- renderPlot({
    input$update
    p=0
    if(as.numeric(isolate(input$slider2))>=50){
      p=50
    }
    z=-5.3718+0.0354*as.numeric(isolate(input$slider1))+1.6159*as.numeric(isolate(input$select1))+1.1768*as.numeric(isolate(input$select2))+0.0697*p+0.9586*as.numeric(isolate(input$select3))-2.9486*as.numeric(isolate(input$select4))
    x=seq(by=1,-8,8)
    y=round(1/(1+exp(-x)),3)
    d=data.frame(x,y)
    if(as.numeric(input$update)>0){
    ggplot(data=d,aes(x=x,y=y))+
      geom_line()+
      geom_point(aes(x=z,y=round(1/(1+exp(-z)),3)),color="red",size=4)+
      geom_hline(aes(yintercept=0.1),linetype = "dashed")+
      geom_text(aes(x=6,y=0.15),label="malignancy threshold: 0.1")+
      labs(x="premises",y="prediction")+
      theme_light()
    }
    
  })
}

shinyApp(ui = ui, server = server)