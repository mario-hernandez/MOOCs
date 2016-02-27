fluidPage(
  # Application title
  titlePanel("Word Cloud of Wikipedia Terms"),

  sidebarLayout(
    # Sidebar with text, buttom and two sliders
    sidebarPanel(
      textInput("term", "Insert your Wikipedia Term:", "Statistics"),
      actionButton("update", "Change"),
      hr(),
      sliderInput("freq",
                  "Minimum Frequency:",
                  min = 1,  max = 50, value = 15),
      sliderInput("max",
                  "Maximum Number of Words:",
                  min = 1,  max = 300,  value = 100)
    ),

    # Show word cloud of the selected wikipedia term
    mainPanel(
      plotOutput("plot")
    )
  )
)
