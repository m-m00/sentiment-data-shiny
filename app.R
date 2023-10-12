library(shiny)
library(tidyverse)
library(ggplot2)

# ensure that CleanSentiment1.csv is in the same folder as this app.R file

# Define UI for application that draws a histogram
ui <- fluidPage(

  titlePanel("Sentiment Data Visualisation for Hihi Stream"),
   
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Selector for variable to plot against mpg ----
      selectInput("group", "Group:",
                  c("Classmate" = "classmate",
                    "Personal" = "personal",
                    "Instructor" = "instructor"))
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Formatted text for caption ----
      h3(textOutput("caption")),
      
      # Output: Plot of the requested variable against mpg ----
      plotOutput("sentimentPlot")
      
    )
  )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
  #choosing the dataset
  sentiData <- read_csv("CleanSentiment1.csv")
  d_sub <- reactive({
    a <- subset(sentiData, individual == input$group)
    return(a)
  })
  
  g <- reactive({
    temp <- input$group
    return(temp)
  })

    output$sentimentPlot <- renderPlot({
      ggplot(d_sub(), aes(x = fct_reorder(Feeling, Frequency, .desc = T), y = Frequency, fill = type)) +
        geom_col() +
        ggtitle(paste("Frequency of 5 Most Common", toupper(g()), "Feelings"))+
        theme(plot.title = element_text(size = 20),
              panel.grid.major = element_blank(), 
              panel.grid.minor = element_blank(),
              panel.background = element_blank(),
              text = element_text(size = 18))+
        xlab("Feelings")+
        scale_fill_manual(values=c('#e87676',
                                   '#539eed'))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
