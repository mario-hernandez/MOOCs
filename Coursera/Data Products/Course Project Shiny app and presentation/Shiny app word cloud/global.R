library(tm)
library(wordcloud)
library(memoise)
library(rvest)


# Using "memoise" to automatically cache the results
getTermMatrix <- memoise(function(term) {

  #I construct here the wikipedia URL with the term that the user submitted
  wiki_url = "https://en.wikipedia.org/wiki/"
  text <- html_text(read_html(paste(wiki_url,term, sep = "")) %>% html_nodes("body"))
  text <- gsub("\n", "", gsub("\t", "", text))

  # Clean a bit the HTML string to keep useful words, although this is not perfect, of course
  myCorpus = Corpus(VectorSource(text))
  myCorpus = tm_map(myCorpus, content_transformer(tolower))
  myCorpus = tm_map(myCorpus, removePunctuation)
  myCorpus = tm_map(myCorpus, removeNumbers)
  myCorpus = tm_map(myCorpus, removeWords,
         c(stopwords("SMART"), "thy", "thou", "thee", "the", "and", "but", "\n", "\t", "isbn", "press", "retrieved", "pdf"))

  myDTM = TermDocumentMatrix(myCorpus,
              control = list(minWordLength = 1))

  m = as.matrix(myDTM)

  sort(rowSums(m), decreasing = TRUE)
})
