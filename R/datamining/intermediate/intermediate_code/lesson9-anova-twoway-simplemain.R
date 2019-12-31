vit = read.csv("vitamin2.csv")

View(vit)

#########
### how to compute the simple main effects
#########

### the simple main effect of a factor is the effect of that factor
### at every level of the other factor

##########

### the simple main effect of the factor gender is
### the effect of gender on the effort resistance for each dose group:
### placebo, low dose and high dose

### we are going to build a separate data frame for each dose group
### with the help of the brackets

### dose = placebo

vitp = vit[vit$dose=="placebo",]

View(vitp)

### run the ANOVA

aov1 = aov(effort~gender, data=vitp)
summary(aov1)

### perform the Tukey HSD (simple comparison)

TukeyHSD(aov1)


### dose = low

vitld = vit[vit$dose=="low dose",]

View(vitld)

### run the ANOVA

aov2 = aov(effort~gender, data=vitld)
summary(aov2)

### get the Tukey HSD

TukeyHSD(aov2)


### dose = high

vithd = vit[vit$dose=="high dose",]

View(vithd)

### run the ANOVA

aov3 = aov(effort~gender, data=vithd)
summary(aov3)

### get the Tukey HSD

TukeyHSD(aov3)

##########

### the simple main effect of the factor dose is the
### effect of dose on the effort resistance for each gender group:
### male and female

### we are going to build a separate data frame for each gender group
### using the brackets

### gender = male

vitm = vit[vit$gender=="male",]

View(vitm)

### run the ANOVA

aov4 = aov(effort~dose, data=vitm)
summary(aov4)

### perform Tukey HSD

TukeyHSD(aov4)

### gender = female

vitf = vit[vit$gender=="female",]

View(vitf)

### run the ANOVA

aov5 = aov(effort~dose, data=vitf)
summary(aov5)

### perform Tukey HSD

TukeyHSD(aov5)


