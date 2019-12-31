mat = read.csv("math.csv")

View(mat)

#########
### how to perform a paired sample t test
#########

### we will check whether there is a significant difference between 
### the average grades of the tests, before and after the math course

#########
### Basic assumptions:

# the differences between the dependent variables are normally distributed
# the differences between the dependent variables do not present important outliers
##########

### run the t.test function

t.test(mat$grade2, mat$grade1, paired=T)


