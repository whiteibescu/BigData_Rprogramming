
#1
M40 = read.csv("NSC2_M40_1000.csv")
str(M40)

BNV = read.csv("NSC2_BNC_1000.csv")
str(BNV)




# 문제 2번
SAT<-read.csv("SAT_2010.csv")
head(SAT)
str(SAT)

attach(SAT)

#A 문제
mean(total)
var(total)
median(total)

#B 문제
plus = mean(total) + sd(total)
minus = mean(total) - sd(total)

#C 문제
SAT[which.max(total),'state']


#D 문제


#E 문제
qqnorm(total)
qqline(total, col = 2, cex=7)