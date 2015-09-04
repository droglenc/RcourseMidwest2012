
source("c:/aaaWork/zGnrlLatex/knitr_setup.R")

library(FSA)      # mrClosed, capHistSum, BluegillJL

data(BluegillJL)   # data from FSA package
view(BluegillJL)
bgtbl <- table(BluegillJL$first,BluegillJL$second)
addmargins(bgtbl)
mr1 <- mrClosed(M=196,n=90,m=9,type="Chapman")
summary(mr1)
confint(mr1)

bgch <- capHistSum(BluegillJL)
bgch$caphist
mr2 <- mrClosed(bgch,type="Chapman")
summary(mr2)

marked <- c(70,200)
num <- c(52,172)
recaps <- c(9,37)
lbls <- c("550-659 mm",">=660 mm")
mr3 <- mrClosed(M=marked,n=num,m=recaps,type="Chapman",labels=lbls)
summary(mr3,incl.SE=TRUE,incl.all=TRUE)
confint(mr3)

data(PikeNYPartial1)
view(PikeNYPartial1)
pikech <- capHistSum(PikeNYPartial1,cols=-1)
pikech$caphist
pikech$sum
mr4 <- mrClosed(pikech,type="Schnabel")
summary(mr4)
confint(mr4)

mr5 <- mrClosed(n=c(16,19,16),m=c(0,7,7),R=c(16,19,0),type="Schnabel")
summary(mr5)
confint(mr5)

