#

function(input, output, session) {
  terms <- reactive({
    # When the update buttom is pressed we update the visualization
    input$update
    isolate({
      withProgress({
        setProgress(message = "We are processing... Wait!")
        getTermMatrix(input$term)
      })
    })
  })

  # Make the wordcloud drawing predictable during a session
  wordcloud_rep <- repeatable(wordcloud)

  output$plot <- renderPlot({
    v <- terms()
    wordcloud_rep(names(v), v, scale=c(4,0.5),
                  min.freq = input$freq, max.words=input$max,
                  colors=brewer.pal(8, "Dark2"))
  })
}
