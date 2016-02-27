# Summary
In this project I have developed a simple cloud word generator for wikipedia terms.

# How to use
You just have to write the term in the text box that reads above "Insert your Wikipedia Term", then the system will scrape the URL that reads like:

https://en.wikipedia.org/wiki/<your_term>

The code will clean the HTML scraped from wikipedia by removing not useful words, signs, HTML code, etc and represent a word cloud.

You can specify the maximum amount of words that you want to show in the cloud, and the minimum frequency that a word needs to have to be represented.

# Reference
This development is partially based on previous work by Fereshteh Karimeddini from RStudio
