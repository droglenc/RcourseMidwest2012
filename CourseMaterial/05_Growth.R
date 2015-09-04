
source("c:/aaaWork/zGnrlLatex/knitr_setup.R")

library(FSA)      # Subset, fitPlot, vbModels, vbStart, vbFuns
library(nlstools) # overview

setwd("C:/aaaWork/Web/fishR/courses/Midwest2012/CourseMaterial/")
d <- read.table("TroutBR.txt",header=TRUE)
str(d)
rbt <- Subset(d,species=="Rainbow")
str(rbt)

clr <- rgb(0,0,0,0.05)
plot(tl~age,data=rbt,col=clr,pch=16,xlab="Age",ylab="Total Length (in)")

vbModels()

( svb1 <- vbStarts(tl~age,data=rbt,type="typical") )
fit1 <- nls(tl~Linf*(1-exp(-K*(age-t0))),data=rbt,start=svb1)
overview(fit1)
fitPlot(fit1,xlab="Age",ylab="Total Length (in)",main="",col.pt=clr,col.mdl="black")

( svb2 <- vbStarts(tl~age,data=rbt,type="GalucciQuinn") )
( vb2 <- vbFuns("GalucciQuinn",simple=TRUE) )
fit2 <- nls(tl~vb2(age,omega,K,t0),data=rbt,start=svb2)
overview(fit2)
fitPlot(fit2,xlab="Age",ylab="Total Length (in)",main="",col.pt=clr,col.mdl="black")

