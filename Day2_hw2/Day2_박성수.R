setwd("C:/Users/user/Desktop/")
library(dplyr)
library(ggplot2)
SATScore = read.csv("SAT_2010.csv")
attach(SATScore)

summary(SATScore)
dim(SATScore)
head(SATScore)
#help(boxplot)

boxplot(SATScore$write, SATScore$math, 
        col=c("yellow", "green"),
        main="Score Comparision",
        xlab="Subjects",
        ylab="Scores",
        #ylim=c(450, 650),
        names=c("Write Score", "Math Score")
)

hist(SATScore$write, col=c("yellow"), 
     # xlim = range(450, 650),
     # ylim = range(0, 12),
     main=paste("Write Score Histogram"))

hist(SATScore$math, col=c("green"),  
     # xlim = range(450, 650), 
     # ylim = range(0, 12), 
     main=paste("Math Score Histogram"))

# help(hist)
# help(pairs)

#문제 B
str(SATScore)
pairs(SATScore[2:9])

# help(plot)
# help(abline)
# help(lines)

#문제 C
plot(math, total)
abline(lm(total~math),col="yellow")
lines(lowess(total~math), col="green")

#------------------------------------------------------------------------
#2번문제 시작


#문제 A
search = read.csv("search.csv")
search_age = read.csv("search_age.csv")
search_gender = read.csv("search_gender.csv")
search_local = read.csv("search_local.csv")
search$일=as.Date(search$일)

#문제 B
SearchVolume<-ggplot(search,aes(x=일))+
    geom_line(aes(y=코로나,color="코로나"))+
    geom_line(aes(y=라면,color="라면"))
SearchVolume<-SearchVolume+geom_line(aes(y=BTS,color="bts"))+
    geom_line(aes(y=zoom,color="zoom"))
SearchVolume<-SearchVolume+labs(y="검색량")
SearchVolume

#문제 C
# help(aes)
#help(geom_bar)
SearchGender<-ggplot(data=search_gender,
                     aes(x=품목,y=count,fill=성별))
SearchGender<-SearchGender+geom_bar(stat="identity")
SearchGender

SearchAll<-ggplot(data=search_gender,
          aes(x=성별,y=count,fill=품목))
SearchAll<-SearchAll+geom_bar(stat="identity",position="dodge")
SearchAll

#문제 D
# help(geom_point)
# geom_point(
#     mapping = NULL,
#     data = NULL,
#     stat = "identity",a
#     position = "identity",
#     ...,
#     na.rm = FALSE,
#     show.legend = NA,
#     inherit.aes = TRUE
# )

SearchVolume<-ggplot(search_age,aes(x=연령))+
    geom_point(aes(y=코로나,color="코로나"))+
    geom_point(aes(y=라면,color="라면"))
SearchVolume<-SearchVolume+geom_line(aes(y=BTS,color="bts"))+
    geom_point(aes(y=zoom,color="zoom"))
SearchVolume<-SearchVolume+labs(y="검색량")
SearchVolume

#문제 E
ggplot(data=search_local,aes(x=지역, fill=검색어))+geom_histogram(stat="count")

