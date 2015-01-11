library(shiny)
library(ggplot2)

shinyUI(pageWithSidebar
        (
             headerPanel("Trigonometric Function Calculator"),
             
             sidebarPanel
             (
                  radioButtons("inputType", "Input Type:", c("Slider" = "slider", "Manual" = "manual")),
                  
                  #Shows if slider is selected
                  conditionalPanel(condition = "input.inputType == 'slider'", 
                                   sliderInput('theta1', "Choose a radian measure.", value = 0, 
                                               min = 0, max = 2*pi, step = 0.001,)),
                  
                  #Shows if manual is selected
                  conditionalPanel(condition = "input.inputType == 'manual'", theta <- NULL,
                                  numericInput('theta2', "Input a radian value.", value = 0)),
                  
                  #Displays trigonometric functions from slider values
                  conditionalPanel(condition = "input.inputType == 'slider'", verbatimTextOutput("sineSlider")),
                  conditionalPanel(condition = "input.inputType == 'slider'", verbatimTextOutput("cosineSlider")),
                  conditionalPanel(condition = "input.inputType == 'slider'", verbatimTextOutput("tangentSlider")),
                  conditionalPanel(condition = "input.inputType == 'slider'", verbatimTextOutput("secantSlider")),
                  conditionalPanel(condition = "input.inputType == 'slider'", verbatimTextOutput("cosecantSlider")),
                  conditionalPanel(condition = "input.inputType == 'slider'", verbatimTextOutput("cotangentSlider")),
                  
                  #Displays trigonometric functions from manual values
                  conditionalPanel(condition = "input.inputType == 'manual'", verbatimTextOutput("sineManual")),
                  conditionalPanel(condition = "input.inputType == 'manual'", verbatimTextOutput("cosineManual")),
                  conditionalPanel(condition = "input.inputType == 'manual'", verbatimTextOutput("tangentManual")),
                  conditionalPanel(condition = "input.inputType == 'manual'", verbatimTextOutput("secantManual")),
                  conditionalPanel(condition = "input.inputType == 'manual'", verbatimTextOutput("cosecantManual")),
                  conditionalPanel(condition = "input.inputType == 'manual'", verbatimTextOutput("cotangentManual"))        
             ),
             
             mainPanel
             (
                  #Shows if slider is selected
                  conditionalPanel(condition = "input.inputType == 'slider'", plotOutput('UnitCircleSlider')),
                  
                  #Shows if manual is selected
                  conditionalPanel(condition = "input.inputType == 'manual'", plotOutput('UnitCircleManual')) 
             )
             
        )
)