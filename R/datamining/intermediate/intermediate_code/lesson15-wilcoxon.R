mat = read.csv("math.csv")

View(mat)

#########
### how to run the Wilcoxon test
#########

### we are going to find out whether there is a significant difference
### between the two grades (before and after the math course) on average

wilcox.test(mat$grade2, mat$grade1, paired=T)

### or, without the continuity correction

wilcox.test(mat$grade2, mat$grade1, paired=T, correct=F)

### compute the medians

median(mat$grade2)

median(mat$grade1)


