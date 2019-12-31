vit = read.csv("vitamin3.csv")

View(vit)

#########
### how to perform the three-way analysis of variance
#########

### we will determine whether the factors dose of vitamin, gender and type
### influence the employees' effort resistance

#########
### Basic assumptions:

# the dependent variable is normally distributed in all groups
# the dependent variable does not present important outliers in any group
# the group variances are equal
##########

### to check the equality of variances, we must create a 
### separate variable to define the twelve groups
### placebo-male-blue collar, low dose-male-blue collar, high dose-male-blue collar
### placebo-male-white collar, low dose-male-white collar, high dose-male-white collar
###... and so on
### then run the leveneTest function in the car package

### perform the three way ANOVA using the aov function

aov1 = aov(effort~dose+gender+type+dose*gender+dose*type+gender*type+dose*gender*type, data=vit)
summary(aov1)

### since the third order interaction effect is statistically significant
### we must compute the simple second order interaction effects


