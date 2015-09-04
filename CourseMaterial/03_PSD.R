
source("c:/aaaWork/zGnrlLatex/knitr_setup.R")

library(FSA) # view, Subset, Summarize, lencat, rcumsum, pssVal, binCI, tictactoe, tictactoeAdd

setwd("C:/aaaWork/Web/fishR/courses/Midwest2012/CourseMaterial/")
d <- read.csv("lab1a.csv")
str(d)
d$len <- d$inches*25.4
levels(d$species)
lmb <- Subset(d,species=="LMB")
str(lmb)

Summarize(lmb$len,digits=1)
lmb1 <- lencat(~len,data=lmb,startcat=75,w=25)
view(lmb1)
hist(lmb$len,breaks=seq(75,525,25),right=FALSE,main="",xlab="Length (mm)",col="gray90")
( lmb.tbl <- table(lmb1$LCat) )

pssVal("Largemouth bass",units="mm")
( lmb.rcum <- rcumsum(lmb.tbl) )
( lmb.stock <- lmb.rcum["200"] )
( lmb.qual <- lmb.rcum["300"] )
lmb.qual/lmb.stock
binCI(lmb.qual,lmb.stock)

bg <- Subset(d,species=="BG")
Summarize(bg$len,digits=1)
bg1 <- lencat(~len,data=bg,startcat=20,w=10)
hist(bg$len,breaks=seq(20,270,10),right=FALSE,main="",xlab="Length (mm)",col="gray90")
bg.tbl <- table(bg1$LCat)
pssVal("Bluegill",units="mm")
( bg.rcum <- rcumsum(bg.tbl) )
bg.stock <- bg.rcum["150"]
bg.qual <- bg.rcum["200"]
bg.qual/bg.stock
binCI(bg.qual,bg.stock)

pssPlot(~len,data=bg,species="Bluegill",units="mm",w=10,ylim=c(0,110),legend.pos="topleft")
pssPlot(~len,data=lmb,species="Largemouth bass",units="mm",startcat=75,w=25)  # right

tictactoe()
tictactoeAdd(c(lmb.qual,lmb.stock),c(bg.qual,bg.stock),pt.col="black")

