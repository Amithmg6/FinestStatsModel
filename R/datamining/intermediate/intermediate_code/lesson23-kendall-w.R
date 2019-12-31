gym = read.csv("gym.csv")

View(gym)

#########
### how to compute the Kendall's W
### it is an inter-rater reliability indicator
### that measures the concordance between three or more raters
### when the rating scale is continuous or ordinal
#########

### we will determine whether there is a concordance
### between the scores given by three judges

require(irr)

kendall(gym, correct=T)   ## corrected for ties


