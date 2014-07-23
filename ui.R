library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
        
        # Application title
        
        headerPanel("A small application to see the summary & head/tail view of a selected data set"),
        
        # Sidebar with controls to provide a caption, select a dataset, and 
        # specify the number of observations to view. Note that changes made
        # to the caption in the textInput control are updated in the output
        # area immediately as you type
        sidebarPanel(
                textInput("caption", "Caption:", "Data Summary"),
                
                selectInput("dataset", "Choose a dataset:", 
                            choices = c("iris","mtcars")),
                
                selectInput("view", "Choose Head or Tail Rows:", 
                            choices = c("head","tail")),
                
                numericInput("obs", "Number of observations to view:", 10)
                
        ),
        
        
        # Show the caption, a summary of the dataset and an HTML table with
        # the requested number of observations
        mainPanel(
                
                h3(textOutput("caption")), 
                
                verbatimTextOutput("summary"),
                
                h2(textOutput("rows")),
                
                tableOutput("view")

        )
))
