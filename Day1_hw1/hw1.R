setwd("C:/Users/user/Desktop/")
library(dplyr)
autompg = read.csv("autompg.csv")

attach(autompg)
#1
#a
subdata1 = subset(autompg, cyl==8)
subdata2 = autompg %>% subset(cyl==4)

attach(subdata1)
mean(hp)
attach(subdata2)
mean(hp)

detach(subdata1)
detach(subdata2)
#b
subdata3 = autompg %>% subset(grepl("chevrolet",autompg[,'carname']))
dim(subdata3)

#2
hitter = read.csv("Hitters.csv")
head(hitter)


attach(hitter)
#A
hitter['hit_rate']=Hits/AtBat

#B
hitter['OBP']=(Hits+Walks)/(AtBat+Walks)

#C
summary(hitter)
mean(hitter$hit_rate)
mean(hitter$OBP)
# OBP  Median :0.3302  Mean   :0.3273 
# hit_rate Median :0.2591 Mean   :0.2599 

#D
nrow(subset(hitter,(hitter$hit_rate>0.2599)&(hitter$OBP>0.3273)))
122 / 320 * 100

#E
new_hitter = hitter[c('CAtBat', 'CHits', 'CHmRun', 'CRuns', 'CRBI', 'CWalks')]

#F
a = function(x){
  return(  max(x)-min(x))
}

table=cbind(lapply(new_hitter,mean),
lapply(new_hitter,min),
lapply(new_hitter,max),
lapply(new_hitter,a))x
colnames(table) = c("mean","min","max","max-min")
table




