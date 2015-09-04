
source("c:/aaaWork/zGnrlLatex/knitr_setup.R")

library(FSA)      # Subset, fitPlot, catchCurve

df <- data.frame(age=0:5,catch=c(47,102,126,104,81,64))
df$logct <- log(df$catch)
df

plot(logct~age,data=df,pch=16,cex=1.25)

( df1 <- Subset(df,age>=2) )
lm1 <- lm(logct~age,data=df1)
coef(lm1)
summary(lm1)
confint(lm1)
fitPlot(lm1,main="",xlab="Age (yrs)",ylab="Log(Catch)")

cc1 <- catchCurve(catch~age,data=df,ages=2:5)
summary(cc1)
confint(cc1)
plot(cc1)

