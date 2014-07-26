library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
        
        # Application title
        
        headerPanel("A small application"),
        
        # Writeup tab acts as a documentation place holder which describes briefly about the project.
        # Sidebar with controls to provide a caption, select a dataset, and 
        # specify the number of observations to view. Select the head or tail set to be fetched.
        # view the results in the Data Summary tab
        # Select the temperature and the number of hours, 
        # estimated water consumption will be displayed in Prediction tab
        
        sidebarPanel(
                               
                selectInput("dataset", "Choose a dataset:", 
                            choices = c("iris","mtcars")),
                
                selectInput("view", "Choose Head or Tail Rows:", 
                            choices = c("head","tail")),
                
                numericInput("obs", "Number of observations to view:", 10),
                
                br(),
                
                sliderInput("temperature", "Tempertature:", 
                            min = -60, max = 120, value = 90, step= 10),
                sliderInput("time", "Mowing Time(in hrs)", 
                            min = 0.5, max = 5, value = 1.5, step= 0.5),
                
                submitButton('Submit')
                
        ),

        mainPanel(
                
                tabsetPanel(
                        tabPanel("Write Up", 
                                 h3('Data Science Course Assignment- Develop Data Products'),
                                 p('I have combined two different applications into one project as part of learning'),
                                 h4('Data set Example'),
                                 p('In this there are two sets mtcars and iris'),
                                 p('use the left side panel to choose the dataset and the number of records to be fetched'),
                                 p('Dataset Summary tab will display the results'),
                                 h4('Prediction Example'),
                                 p('Temperature, Mowing, Thirst Example'),
                                 p('if the temperature were 90 degrees Fahrenheit and someone mowed for one and a half hours 
                                 how much water would you estimate that they would want to drink during three hours outside?'),
                                 p('Once we have the multiple regression equation, it is relatively straight forward to make predictions.
                                 In this example, the regression equation was given by
                                 Water = - 122 + 1.51*Temperature + 12.5*Mowing Time
                                 Now set temperature to 90 degrees and mowing for 1.5 hours as given in the example. 
                                 Water=-122+1.51*90+12.5*1.5=32.65 oz
                                 We estimate that the person in the example would drink a little less than 33 ounces.'),
                                 p('Please use the left side panel to choose the temperature and the number of hours of mowing time
                                 Prediction tab will display the estimate that the person can consume water')
                            ),
                        tabPanel("Data Set Summary", 
                                        h4('You have selected'),
                                        h3(textOutput("dataset")),
                                        h3(textOutput("obs")),
                                        h3(textOutput("rows")),
                                        tableOutput("view")
                                 ),
                        tabPanel("Prediction", 
                                        h3('Results of Prediction'),
                                        h4('You entered'),
                                        verbatimTextOutput("temperature"),
                                        verbatimTextOutput("time"),
                                        h4('We estimate that the person in the example would drink a little less than'),
                                        verbatimTextOutput("prediction"),
                                        h4('Ounches')
                        )
             
                                 
                        )
                )
)
)

