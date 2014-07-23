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
        
        # The output$caption is computed based on a reactive expression that
        # returns input$caption. When the user changes the "caption" field:
        #
        #  1) This expression is automatically called to recompute the output 
        #  2) The new caption is pushed back to the browser for re-display
        # 
        # Note that because the data-oriented reactive expressions below don't 
        # depend on input$caption, those expressions are NOT called when 
        # input$caption changes.
        output$caption <- renderText({
                input$caption
                        })
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
        # The output$summary depends on the datasetInput reactive expression, 
        # so will be re-executed whenever datasetInput is invalidated
        # (i.e. whenever the input$dataset changes)
        output$summary <- renderPrint({
                dataset <- datasetInput()
                summary(dataset)
                
                
        })

        

})