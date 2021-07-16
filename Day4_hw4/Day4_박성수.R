### 문제 1번
SAT = read.csv("SAT_2010.csv")

# a 문제
dupes <- duplicated(SAT)
table(dupes)
which(dupes=="True")

# b 문제
str(SAT)

# c 문제
na_count <- 
  sapply(dupes, function(y)
    sum(length(which(is.na(
      y
    )))))

na_df <- data.frame(na_count)
na_df

# d 문제

answer<-data.frame(cor(SAT[2:9]))

subset(answer, expenditure >0.9 & expenditure <1)
subset(answer, pupil_teacher_ratio>0.9 & pupil_teacher_ratio<1)
subset(answer, salary>0.9 & salary<1)
subset(answer, read>0.9 & read<1)
subset(answer, math>0.9 & math<1)
subset(answer, write>0.9 & write<1)
subset(answer, total>0.9 & total<1)
answer

### 2번 문제
# install.packages("PerformanceAnalytics")
# install.packages("corrplot")
library(PerformanceAnalytics)
library(corrplot)
# a 문제
happy = read.csv("happy2020.csv")
str(happy)


# b 문제

colSums(is.na(happy))

# c 문제

min(happy$Ladder.score)
happy[which.min(happy$Ladder.score), "Country.name" ]

max(happy$Ladder.score)
happy[which.max(happy$Ladder.score), "Country.name" ]
# d 문제



# e 문제


### 3번 문제
# install.packages("RColorBrewer")
# install.packages("wordcloud")
library(RColorBrewer)
library(wordcloud)
help(wordcloud)


filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt" 
text <- readLines(filePath)
help(wordcloud)

# wordcloud(words,freq,scale=c(4,.5),
#           min.freq=3,max.words=Inf,
#           random.order=TRUE, 
#           random.color=FALSE, 
#           rot.per=.1,
#           colors="black",
#           ordered.colors=FALSE,
#           use.r.layout=FALSE,
#           fixed.asp=TRUE, ...)
wordcloud(text$word, text$freq, c(8, .5), 2,, False,.1)