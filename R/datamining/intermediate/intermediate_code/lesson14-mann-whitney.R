sp = read.csv("spanish.csv")

View(sp)

#########
### how to run the Mann-Whitney test
#########

### we will check whether there is a difference between the two groups of students
### with respect to the average test score, using the Mann-Whitney test

wilcox.test(sp$score~sp$course)

### or without continuity correction

wilcox.test(sp$score~sp$course, correct=F)

### to get the group medians

require(psych)

describeBy(sp$score, sp$course)

