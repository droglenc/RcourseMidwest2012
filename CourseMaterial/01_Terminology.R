
source("c:/aaaWork/zGnrlLatex/knitr_setup.R")

library(FSA)       # Subset, view, lencat, mrClosed

3+4*2
res <- 3+4*2
res

sqrt(17)
( res1 <- sqrt(17) )

dat <- c(3,6,8,3,5,6,2,7,6,8,2,10)
mean(dat)
mean(dat,trim=0.1)

mr1 <- mrClosed(346,184,49)
summary(mr1)
confint(mr1)

( numSpec <- c(4,8,9,3) )
( lake <- c("Star","Twin","Long","Deep") )
( springFed <- c(TRUE,FALSE,FALSE,TRUE) )
( maxDepth <- c(6.5,7.8,3.8,25.6) )

( df <- data.frame(lake,numSpec,maxDepth,springFed) )
str(df)

setwd("C:/aaaWork/Web/fishR/courses/Midwest2012/CourseMaterial/")

ex1a <- read.table("Example1.txt",header=TRUE,sep="\t")
str(ex1a)
ex1a

ex1b <- read.csv("Example1.csv")
str(ex1b)

ex1a[2,]
ex1a[,2]
ex1a$tl
ex1a$w
ex1a$w[2]
ex1a$w[-2]

( ex1a.1 <- Subset(ex1a,segment=="Down") )

( ex1a.2 <- Subset(ex1a,species!="BKT") )

( ex1a.3 <- Subset(ex1a,tl<50) )

( ex1a.4 <- Subset(ex1a,tl<50 & species=="SLS") )

( ex1a.5 <- Subset(ex1a,tl<50 | w>20) )

str(ex1a)
ex1a$tl.in <- ex1a$tl/25.4
ex1a$w.lbs <- ex1a$w/454
str(ex1a)

ex1a <- lencat(~tl,data=ex1a,breaks=c(40,75,125,175))
str(ex1a)
view(ex1a)

