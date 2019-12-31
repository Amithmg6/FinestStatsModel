vit = read.csv("vitamin3.csv")

View(vit)

#########
### how to compute the simple second order interaction effects
#########

### the simple second order interaction effect is 
### the interaction effect of two factors at each level of the third factor

### here we have three simple second order interaction effects
### dose * gender for each type of employee
### dose * type of employee for each gender category
### gender * type of employee for each dose of vitamin

#############

### we will compute the simple second order interaction effect
### of dose and type of employee for each gender category:
### male and female

### gender = male

### create a new data frame with the male subjects

vitm <- vit[vit$gender=="male",]

aov1 <- aov(effort~dose*type, data=vitm)
summary(aov1)

### gender = female

### create a new data frame with the female subjects

vitf <- vit[vit$gender=="female",]

aov2 <- aov(effort~dose*type, data=vitf)
summary(aov2)

### since both second order interactions are statistically significant
### we will compute the simple main effects for both variables 
### dose and type of employee

