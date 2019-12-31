ice = read.csv("icecream.csv")

View(ice)

#########
### how to perform the partial correlation
### using the package ppcor
#########

### we will compute and interpret the partial correlation 
### between the icecream sales and the number of heart attacks
### control variable: temperature at noon

### run the Person correlation between the variables first

cor.test(ice$attacks, ice$icecream)

### load the package

require(ppcor)

### run the partial correlation

pcor.test(ice$attacks, ice$icecream, ice$temp, method="pearson")



