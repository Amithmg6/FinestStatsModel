hw = read.csv("hw.csv")

View(hw)

#########
### how to perform the Spearman and Kendall correlation
#########

### we will compute and interpret the correlation 
### between subjects' height and weight

############

### Spearman correlation

cor.test(hw$height, hw$weight, method="spearman", conf.level = 0.95, exact=FALSE)

### we set the option exact to FALSE in order to force the program
### to use the asymptotic formula

### alternatively, we can use the package pspearman

require(pspearman)

spearman.test(hw$height, hw$weight, approximation = "AS89")

### AS89 is an approximation algorithm used to compute the asymptotic p-values
### other values for the option approximation are exact and t-distribution

#############

### Kendall corelation

cor.test(hw$height, hw$weight, method="kendall", conf.level = 0.95, exact=FALSE)


