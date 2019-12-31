vit = read.csv("vitamin1.csv")

View(vit)

#########
### how to run the Kruskall-Wallis test
#########

### we are going to check whether there is a significant difference
### between the three groups with respect to the average effort resistance

### run the test

kruskal.test(vit$effort~vit$dose)

### get the medians

require(psych)

describeBy(vit$effort, vit$dose)
