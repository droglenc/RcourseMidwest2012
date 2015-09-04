
# THIS SECTION CAN BE GENERALLY BE IGNORED IF VIEWED AS AN R SCRIPT ############
# knitr custom hooks - set default plot options
knit_hooks$set(par1 = function(before, options, envir) {
    if (before) par(mar=c(3.5,3.5,1,1),mgp=c(2.1,0.4,0),tcl=-0.2)
})
# knitr options -- figure handling
opts_chunk$set(fig.path='Figs/', fig.width=3.5, fig.height=3.5, out.width='.4\\linewidth', fig.align='center')
# knitr options -- output look
opts_chunk$set(prompt=TRUE,comment='', tidy=FALSE, highlight=TRUE)
# r options -- Ogle preferences
options(width=90, show.signif.stars=FALSE, continue=" ", contrasts=c("contr.sum","contr.poly"), useFancyQuotes=FALSE)
# A list of required packages -- for reproducibilities purpose
rqrd <- c("FSA")
# END OF SECTION TO BE IGNORED #################################################
library(FSA)      # catchCurve

df <- data.frame(age=0:5,catch=c(47,102,126,104,81,64))
df$logct <- log(df$catch)

ttl.catch <- sum(df$catch)
max.catch <- max(df$catch)
age.at.max.catch <- df$age[which(df$catch==max.catch)]

cc1 <- catchCurve(catch~age,data=df,ages=age.at.max.catch:5)
sum1 <- summary(cc1)
ci1 <- confint(cc1)

plot(cc1)

