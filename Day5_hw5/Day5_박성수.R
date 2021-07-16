library(ggplot2)
library(dplyr)
library(reshape)
library(tseries)
library(cowplot)
library(forecast)

# install.packages("reshape")
# install.packages("tseries")
# install.packages("cowplot")
# install.packages("forecast")
TSLA = read.csv("TSLA.csv")

#1번 문제
str(TSLA)
head(TSLA)
dim(TSLA)

help(max)



#2번 문제
summary(TSLA)
#엑셀 검색을 통해서 정답 찾음

#3번 문제 

TSLA$Date = as.Date(TSLA$Date)
str(TSLA)

TSLA  %>%
  select(-Volume) %>%
  melt(id.vars = c("Date")) %>%
  ggplot() +
  geom_point(aes(x = Date, y = value, col = variable),
             alpha =  0.5) +
  geom_line(aes(x = Date, y = value, col = variable, group = variable),
            alpha = 0.8) +
  xlab("Date") + ylab("Stock Price") + 
  labs(col = "Types of Price") + 
  theme_bw() +
  theme(text = element_text(size = 15, face = "bold"),
        legend.position = c(0.2,0.8))