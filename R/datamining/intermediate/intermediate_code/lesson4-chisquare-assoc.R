bf = read.csv("breakfast.csv")

View(bf)

#########
### how to perform the chi square test for association
### using the package gmodels
#########

### we will compute the chi square for association 
### for the variables agecat (age category) and bfast (breakfast preference)

### load the package

require(gmodels)

### execute the CrossTable function

CrossTable(bf$agecat, bf$bfast, expected=T, prop.r=F, prop.c=F, prop.t=F, prop.chisq=F)

### if some expected values are lower than 5,
### we can compute the Fisher's exact test

fisher.test(bf$agecat, bf$bfast, simulate.p.value = T)

##########

### how to compute the Cramer's V
### with the lsr package

### load the package

require(lsr)

cramersV(bf$agecat, bf$bfast)


