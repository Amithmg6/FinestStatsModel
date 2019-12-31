tch = read.csv("teachers.csv")

View(tch)

#########
### how to compute the Cohen's kappa
### it is an inter-rater reliability indicator
### that measures the concordance between two raters
### when the rating scale is ordinal
#########

### we will determine whether there is a concordance
### between the two teachers' grades

## with the package psy

require(psy)

ckappa(tch)

### this function displays the concordance table and the K value,
### but it does not compute the p value

### with the package fmsb

require(fmsb)

Kappa.test(tch$teacher1, tch$teacher2)

## this function computes both the p value and the confidence interval for K


