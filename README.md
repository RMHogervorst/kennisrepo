I forked this repository from so simple themes:

https://mmistakes.github.io/so-simple-theme

I have tried to make the knowledge repo from airbnb working on my windows pc. 
However, it contantly failed. Therefore a simpler solution might work for me.

I work almost exclusively in R and I can create Rmarkdown documents.
I've already worked with this software, my main blog works like that. 

## What I would like to do

- break off everything that isn't necessary for deployment on github.
- add tests for pull requests that
    - lint the R code and give style errors
    - test and execute the code? (optional)
    - do some spelling tests (ropensci hunspell might do the trick?)
    - perhaps a measure of text complexity? 



reading complexity can be calculated ourselves:

Gunning-Fog Index

The following is the algorithm to determine the Gunning-Fog index.

    Calculate the average number of words you use per sentence.
    Calculate the percentage of difficult words in the sample (words with three or more syllables).
    Add the totals together, and multiply the sum by 0.4.
    Algorithm: (average_words_sentence + number_words_three_syllables_plus) * 0.4
*only syllables is difficult)
The result is your Gunning-Fog index, which is a rough measure of how many years of schooling it would take someone to understand the content. The lower the number, the more understandable the content will be to your visitors. Results over seventeen are reported as seventeen, where seventeen is considered post-graduate level. 

flesh -reading ease

    Calculate the average number of words you use per sentence.
    Calculate the average number of syllables per word.
    Multiply the average number of syllables per word multiplied by 84.6 and subtract it from the average number of words multiplied by 1.015.
    Subtract the result from 206.835.
    Algorithm: 206.835 - (1.015 * average_words_sentence) - (84.6 * average_syllables_word)

The result is an index number that rates the text on a 100-point scale. The higher the score, the easier it is to understand the document. Authors are encouraged to aim for a score of approximately 60 to 70. 

Flesch-Kincaid grade level

The following is the algorithm to determine the Flesch-Kincaid grade level.

    Calculate the average number of words you use per sentence.
    Calculate the average number of syllables per word.
    Multiply the average number of words by 0.39 and add it to the average number of syllables per word multiplied by 11.8.
    Subtract 15.50 from the result.
    Algorithm: (0.39 * average_words_sentence) + (11.8 * average_syllables_word) - 15.9

The result is the Flesch-Kincaid grade level. Like the Gunning-Fog index, it is a rough measure of how many years of schooling it would take someone to understand the content. Negative results are reported as zero, and numbers over twelve are reported as twelve. 

syllables english: http://www.speech.cs.cmu.edu/cgi-bin/cmudict
otherwise quanteda package. 

### suggested steps in a pull request:
So perhaps a text extraction part: 
- identify newest addition (newest file added)
- if it is a rmarkdowndocument:
    - seperate code and text from document
    - code analyses
        - lint the R code and give style errors
        - test and execute the code? (optional)
    - text analyses:
        - spelling with hunspell *with suggestions?  (could use devtools::spellcheck)
        - code complexity with with other tools
- combine results from these steps into a comprehensive report
