stud = read.csv("students.csv")

View(stud)

#########
### the multiple regression analysis - checking the assumptions
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

### run the regression again

fit <- lm(score~iq+hours, data = stud)

###############

### to detect the outliers, we get the standardized residuals
### and check whether there are values greater than 3

res <- residuals(fit)

zres <- scale(res)

View(zres)

#################

### to check the independence of errors we use the Durbin-Watson test

### we can find it in the car package

require(car)

durbinWatsonTest(fit)

### alternatively, we can find the Durbin-Watson test 
### in the lmtest package

require(lmtest)

dwtest(fit)

################

### to check for multicollinearity we compute the VIF
### (variance inflation factor)

### first we create a new data frame with the independents only

x <- data.frame(stud$iq, stud$hours)

View(x)

## load the usdm package

require(usdm)

### use the vif function

vif(x)

###################

### to check for homoskedasticity, we must plot the
### residuals against the fitted (predicted) test score values

### we will use ggplot for that

require(ggplot2)

### we already have the residuals stored in the variable res

### now we get the predicted values of the response variable

pred <- fitted(fit)

### create a new data frame with the residuals and the fitted values

dat <- data.frame(pred, res)

View(dat)

### build the chart

ggplot()+geom_point(data=dat, aes(x=res, y=pred))

##################

### finally, we check for the normality of the residuals

shapiro.test(res)


