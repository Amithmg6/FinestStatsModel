vit = read.csv("vitamin2.csv")

View(vit)

#########
### how to perform the two-way analysis of variance
#########

### we will determine whether the factors dose of vitamin and gender 
### influence the employees' effort resistance

#########
### Basic assumptions:

# the dependent variable is normally distributed in all groups
# the dependent variable does not present important outliers in any group
# the group variances are equal
##########

### to check the equality of variances, we must create a 
### separate variable to define the six groups
### placebo-male, low dose-male, high dose-male
### placebo-female, low dose-female, high dose-female
### (hint: you can do that with brackets or with the revalue function in the plyr package)
### then run the leveneTest function in the car package

### perform the two way ANOVA using the aov function

aov1 = aov(effort~dose+gender+dose*gender, data=vit)
summary(aov1)

### since the interaction effect is statistically significant,
### we are going to compute the simple main effects of the two factors

