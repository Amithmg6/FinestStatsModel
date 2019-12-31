hw = read.csv("hw.csv")

View(hw)

#########
### how to perform the Pearson correlation
#########

### we will compute and interpret the correlation 
### between subjects' height and weight

##############
### Basic assumptions:

# the variables are normally distributed
# there are no significant outliers
# the relationship between the variables is approximately linear
###############

### run the correlation test

cor.test(hw$height, hw$weight, method="pearson", alternative="two.sided", conf.level=0.95)

### or

cor.test(hw$height, hw$weight)


