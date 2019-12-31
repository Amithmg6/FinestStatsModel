brd = read.csv("brand.csv")

View(brd)

#########
### how to compute the Cronbach's alpha
### this indicator measures the internal consistency of a multi-item scale
#########

### we will use the psy package

require(psy)

cronbach(brd)

### with the fmsb package

require(fmsb)

CronbachAlpha(brd)


