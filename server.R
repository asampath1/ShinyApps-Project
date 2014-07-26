library(shiny)
library(datasets)

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
        
        # By declaring datasetInput as a reactive expression we ensure that:
        #
        #  1) It is only called when the inputs it depends on changes
        #  2) The computation and result are shared by all the callers (it 
        #     only executes a single time)
        #
        datasetInput <- reactive({
                switch(input$dataset,
                        "iris" = iris,
                        "mtcars" = mtcars,
                        input$view)
        })
        # output for the dataset display.
        output$rows <- renderText({
                input$view
        })
        output$view <- renderTable({
                if (input$view == "head") {
                head(datasetInput(), n = input$obs) }
                else
                {tail(datasetInput(), n = input$obs) 
                }
        })
        output$dataset <- renderPrint({input$dataset})
        output$obs <- renderPrint({input$obs})
        
        # output for the Water consumption prediction.
        output$temperature <- renderPrint({input$temperature})
        output$time <- renderPrint({input$time})
        output$prediction <- renderPrint({
                (- 122 + 1.51*input$temperature + 12.5 * input$time)})
        
})
