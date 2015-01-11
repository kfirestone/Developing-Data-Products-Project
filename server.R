library(shiny)
library(ggplot2)

drawUnitCircle <- function()
{
     points <- seq(0, 2*pi, length.out = 500)
     x <- cos(points)
     y <- sin(points)
     return(data.frame(x = x,y = y))
}

UnitCircle <- drawUnitCircle()

shinyServer
     (
          function(input, output)
          {
             output$sineSlider <- renderPrint({noquote(paste("sin", "(", input$theta1, ")", " = ", 
                                                             round(sin(input$theta1),3), sep = ""))})
             output$cosineSlider <- renderPrint({noquote(paste("cos", "(", input$theta1, ")", " = ", 
                                                             round(cos(input$theta1),3), sep = ""))})
             output$tangentSlider <- renderPrint({noquote(paste("tan", "(", input$theta1, ")", " = ", 
                                                             round(tan(input$theta1),3), sep = ""))})
             output$secantSlider <- renderPrint({noquote(paste("sec", "(", input$theta1, ")", " = ", 
                                                             round(1/cos(input$theta1),3), sep = ""))})
             output$cosecantSlider <- renderPrint({noquote(paste("csc", "(", input$theta1, ")", " = ", 
                                                             round(1/sin(input$theta1),3), sep = ""))})
             output$cotangentSlider <- renderPrint({noquote(paste("cot", "(", input$theta1, ")", " = ", 
                                                             round(1/tan(input$theta1),3), sep = ""))})
             
             output$sineManual <- renderPrint({noquote(paste("sin", "(", input$theta2, ")", " = ", 
                                                             round(sin(input$theta2),3), sep = ""))})
             output$cosineManual <- renderPrint({noquote(paste("cos", "(", input$theta2, ")", " = ", 
                                                             round(cos(input$theta2),3), sep = ""))})
             output$tangentManual <- renderPrint({noquote(paste("tan", "(", input$theta2, ")", " = ", 
                                                             round(tan(input$theta2),3), sep = ""))}) 
             output$secantManual <- renderPrint({noquote(paste("sec", "(", input$theta2, ")", " = ", 
                                                             round(1/cos(input$theta2),3), sep = ""))}) 
             output$cosecantManual <- renderPrint({noquote(paste("csc", "(", input$theta2, ")", " = ", 
                                                             round(1/sin(input$theta2),3), sep = ""))}) 
             output$cotangentManual <- renderPrint({noquote(paste("cot", "(", input$theta2, ")", " = ", 
                                                             round(1/tan(input$theta2),3), sep = ""))})
             
             output$UnitCircleSlider <- renderPlot(ggplot(UnitCircle, aes(x,y)) + geom_path() +
                                                          coord_cartesian(xlim = c(-1.25, 1.25), ylim = c(-1.25, 1.25)) +
                                                          geom_segment(x = -1.25, y = 0, xend = 1.25, yend = 0) +
                                                          geom_segment(x = 0, y = -1.25, xend = 0, yend = 1.25) +
                                                          geom_segment(x = 0, y = 0, xend = cos(input$theta1), 
                                                                       yend = sin(input$theta1), colour = "red") +
                                                          xlab("") + ylab("") +
                                                          theme(panel.background = element_blank(), axis.text.x = element_blank(),
                                                                axis.text.y = element_blank(), axis.ticks = element_blank(),
                                                                panel.grid.minor = element_blank()), width = 500, height = 500)
             
             output$UnitCircleManual <- renderPlot(ggplot(UnitCircle, aes(x,y)) + geom_path() +
                                                        coord_cartesian(xlim = c(-1.25, 1.25), ylim = c(-1.25, 1.25)) +
                                                        geom_segment(x = -1.25, y = 0, xend = 1.25, yend = 0) +
                                                        geom_segment(x = 0, y = -1.25, xend = 0, yend = 1.25) +
                                                        geom_segment(x = 0, y = 0, xend = cos(input$theta2), 
                                                                     yend = sin(input$theta2), colour = "red") +
                                                        xlab("") + ylab("") +
                                                        theme(panel.background = element_blank(), axis.text.x = element_blank(),
                                                              axis.text.y = element_blank(), axis.ticks = element_blank(),
                                                              panel.grid.minor = element_blank()), width = 500, height = 500)
          }
     )
     
     