
source("c:/aaaWork/zGnrlLatex/knitr_setup.R")

library(FSA)        # view, Subset, Summarize, hist
library(plotrix)    # plotH

setwd("C:/aaaWork/Web/fishR/courses/Midwest2012/CourseMaterial/")
Herman <- read.table("Herman.txt",header=TRUE,sep="\t")
str(Herman)
levels(Herman$spec)
Herman$fyr <- factor(Herman$yr)
str(Herman)
levels(Herman$fyr)

( tSpec <- table(Herman$spec) )
( ptSpec <- prop.table(tSpec)*100 )
round(ptSpec,1)
( tSpecYr <- table(Herman$spec,Herman$fyr) )
addmargins(tSpecYr)
round(prop.table(tSpecYr,margin=2)*100,1)

Hbbh <- Subset(Herman,spec=="bbh")
Summarize(Hbbh$tl,digits=1)
Summarize(tl~spec,data=Herman,digits=1)
Summarize(tl~fyr*spec,data=Herman,digits=1)

hist(Hbbh$tl,xlab="Total Length (cm)",main="")
hist(Hbbh$tl,xlab="Total Length (cm)",main="",xlim=c(15,35),ylim=c(0,1400),right=FALSE, 
     col="gray80",breaks=seq(15,36,1))

tSpec
barplot(tSpec,xlab="Species",ylab="Number of Individuals")
( sumSpec <- Summarize(tl~spec,data=Herman,digits=1) )
plotH(mean~spec,data=sumSpec,xlab="Species",ylab="Mean Total Length (cm)",ylim=c(0,35))

BullTroutRML1 <- read.table("BullTroutRML1.txt",header=TRUE,sep="\t")
str(BullTroutRML1)
BullTroutRML1$logFL <- log(BullTroutRML1$fl)
BullTroutRML1$logW <- log(BullTroutRML1$mass)
str(BullTroutRML1)
view(BullTroutRML1)

plot(mass~fl,data=BullTroutRML1,xlab="Fork Length (mm)",ylab="Weight (g)")
plot(logW~logFL,data=BullTroutRML1,xlab="log Fork Length (mm)",ylab="log Weight (g)",
     pch=16)
cor(BullTroutRML1$logW,BullTroutRML1$logFL)

hist(tl~fyr,data=Hbbh,xlab="Total Length (cm)",main="",right=FALSE,breaks=seq(15,36,1))
hist(tl~fyr,data=Hbbh,xlab="Total Length (cm)",main="",right=FALSE,
     breaks=seq(15,36,1),same.ylim=FALSE)

pts <- c(16,3)
clrs <- c("black","red")
plot(logW~logFL,data=BullTroutRML1,xlab="log Fork Length (mm)",ylab="log Weight (g)",
pch=pts[era],col=clrs[era])
legend("topleft",legend=levels(BullTroutRML1$era),pch=pts,col=clrs)

