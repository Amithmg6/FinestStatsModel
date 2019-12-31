vit = read.csv("vitamin1.csv")

View(vit)

#########
### how to perform the one-way analysis of variance
#########

### we will check whether there is a difference between the three groups
### (placebo, low dose, high dose) with respect to the average effort resistance

#########
### Basic assumptions:

# the dependent variable is normally distributed in all groups
# the dependent variable does not present important outliers in any group
# the group variances are equal*

### we are going to check only the assumptions marked with an asterisk (*)
##########

### to check the assumption of equality of variances

require(car)

leveneTest(vit$effort, vit$dose)

##########

### run the one-way ANOVA using the aov function

### if the group variances are equal

aov1 = aov(effort~dose, data=vit)
summary(aov1)

### if the group variances are NOT equal, we run the Welch test

oneway.test(effort~dose, data=vit, var.equal=F)

##########

### how to perform the simple (post-hoc) comparisons

### Tukey HSD for equal variances

TukeyHSD(aov1)    # you must get aov1 first

### Bonferroni, also for equal variances

pairwise.t.test(vit$effort, vit$dose, p.adjust.method = "bonferroni")

### post-hoc tests for unequal variances do not seem to be available in R :(

