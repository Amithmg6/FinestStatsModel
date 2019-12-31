vit = read.csv("vitamin3.csv")

View(vit)

#########
### how to compute the simple main effects
#########

### in a three-way ANOVA, the simple main effect of a factor is the effect of that factor
### at every combination of the levels of the other two factors

### we will compute the simple main effecs of the factor dose
### at each combination of gender and type of employee:
### male-blue collar, female-blue collar,
### male-white collar, female-white collar

######## male - blue collar

### create a new data frame with the male subjects, blue collar

vitmbcol <- vit[vit$gender=="male" & vit$type=="blue collar",]

### run the ANOVA

aov1 <- aov(effort~dose, data=vitmbcol)
summary(aov1)

### compute the Tukey HSD

TukeyHSD(aov1)

####### female - blue collar

### create a new data frame with the female subjects, blue collar

vitfbcol <- vit[vit$gender=="female" & vit$type=="blue collar",]

### run the ANOVA

aov2 <- aov(effort~dose, data=vitfbcol)
summary(aov2)

### compute the Tukey HSD

TukeyHSD(aov2)

########## male - white collar

### create a new data frame with the male subjects, white collar

vitmwcol <- vit[vit$gender=="male" & vit$type=="white collar",]

### run the ANOVA

aov3 <- aov(effort~dose, data=vitmwcol)
summary(aov3)

### compute the Tukey HSD

TukeyHSD(aov3)

############# female - white collar

### create a new data frame with the female subjects, white collar

vitfwcol <- vit[vit$gender=="female" & vit$type=="white collar",]

### run the ANOVA

aov4 <- aov(effort~dose, data=vitfwcol)
summary(aov4)

### compute the Tukey HSD

TukeyHSD(aov4)


