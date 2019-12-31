stud = read.csv("students.csv")

View(stud)

#########
### how to perform the hierarchical regression analysis
#########

### dependent variable: test score (score)
### explainers: iq, hours of study (hours) and gender

### the independent variables will be introduced in blocks

### block 1: iq
### block 2: iq and hours of study
### block 3: iq, hours of study (hours) and gender

### we run a separate regression for each block
### using the lm function

fit1 <- lm(score~iq, data = stud)

fit2 <- lm(score~iq+hours, data = stud)

fit3 <- lm(score~iq+hours+gender, data = stud)

### to get the results of each regression analysis separately
### we use the summary function

summary(fit1)

summary(fit2)

summary(fit3)

### to get the ANOVA table for the whole model
### we run the following

anova(fit1, fit2, fit3)

### the last two columns tell us whether the model improved by adding new variables
### i.e. whether the R square increases are statistically significant


