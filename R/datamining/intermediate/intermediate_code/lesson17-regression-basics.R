stud = read.csv("students.csv")

View(stud)

#########
### how to perform the multiple regression analysis
#########

#########
### Basic assumptions:

# the relationship between the variables is liniar
# the variables do not present important outliers*
# there is independence of errors*
# there is no important multicollinearity*
# there is homoskedasticity*
# the residuals are normally distributed*

### we will check only the assumptions marked with an asterisk (*)
##########

### dependent variable: test score (score)
### explainers: iq and hours of study (hours)

### how to get the goodness-of-fit (R squared)
### the ANOVA table and the regression coefficients

fit <- lm(score~iq+hours, data = stud)
summary(fit)



