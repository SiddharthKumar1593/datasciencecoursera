library(shiny)
library(datasets)

DataofMPG <- mtcars
DataofMPG$am <- factor(DataofMPG$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
    
    formTexting <- reactive({
        paste("mpg ~", input$variable)
    })
    
    formTestPt <- reactive({
        paste("mpg ~", "as.integer(", input$variable, ")")
    })
    
    fit <- reactive({
        lm(as.formula(formTestPt()), data=DataofMPG)
    })
    
    output$caption <- renderText({
        formTexting()
    })
    
    output$mpgBoxPlot <- renderPlot({
        boxplot(as.formula(formTexting()), 
                data = DataofMPG,
                outline = input$outliers)
    })
    
    output$fit <- renderPrint({
        summary(fit())
    })
    
    output$mpgPlot <- renderPlot({
        with(DataofMPG, {
            plot(as.formula(formTestPt()))
            abline(fit(), col=2)
        })
    })
    
})