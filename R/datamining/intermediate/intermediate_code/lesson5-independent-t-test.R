sp = read.csv("spanish.csv")

View(sp)

#########
### how to perform the independent sample t test
#########

### we will determine whether there is a significant difference in average grade
### between the students who took the Spanish course and those who did not take it

#########
### Basic assumptions:

# the dependent variable is normally distributed in both groups
# the dependent variable does not present important outliers in any group
# the group variances are equal*

### we are going to check only the assumptions marked with an asterisk (*)
##########

### to check the assumption of homogeneity of variances
### we will use the leveneTest function in the car package

### load the package

require(car)

leveneTest(sp$score, sp$course)

### to compute the t test, we use the t.test function

### if the group variances are equal

t.test(sp$score~sp$course, var.equal=T)

### if the group variances are NOT equal we will execute the Welch test
  
t.test(sp$score~sp$course, var.equal=F)



