vit = read.csv("vitamin-m.csv")

View(vit)

#########
### how to perform the one-way multivariate analysis of variance (MANOVA)
#########

### we will check whether there is a difference between the three groups
### (placebo, low dose, high dose) with respect to the average effort resistance
### and the average stress resistance

#########
### Basic assumptions:

# the dependent variables are normally distributed in all factor groups
# the dependent variables do not present important outliers in any group
# the relationship between the dependent variables are approximately linear in all groups
# the dependent variables are not strongly intercorrelated (there is no multicollinearity)
# the group variances are equal for all the dependent variables
# the group covariances are equal*

### we will check only the assumptions marked with an asterisk (*)
##########

### check the assumption of homogeneity of covariances first

### load the package biotools

require(biotools)

### create a new data frame with the dependent variables only

vit2 <- vit[c(1,2)]

View(vit2)

### apply the Box's M test from biotools

boxM(vit2, vit$dose)

### before running MANOVA, we create a matrix with the dependent variables
### this will be the dependent variable in the manova function

y <- cbind(vit$effort, vit$stress)

print(y)

### create the factor dose

dose <- vit$dose

print(dose)

### run the manova function from the stats package

model <- manova(y~dose)
summary(model, test="Wilks")

### we used the Wilks test because the covariances are equal 

### other test options  Pillai, Hotelling, Roy

### the Pillai test (Pillai's trace) is recommended if the covariances are not equal

summary(model, test="Pillai")

### N.B. Tukey HSD does NOT work with the manova function 
### if you need it, you must use it for each dependent variable separately
### i.e. you must run an univariate one-way ANOVA for each dependent (using the aov function),
### and then apply the TukeyHSD function to the results

