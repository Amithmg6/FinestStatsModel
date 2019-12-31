stud = read.csv("students.csv")

View(stud)

#########
### how to perform the multiple regression analysis with DUMMY variables
#########

### dependent variable: test score (score)
### explainers: iq, hours of study (hours) and gender

### the procedure is the same

fit <- lm(score~iq+hours+gender, data = stud)
summary(fit)


