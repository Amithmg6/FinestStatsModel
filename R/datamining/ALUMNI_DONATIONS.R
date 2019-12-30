# ALUMNI DONATIONS

library(lattice)

don = read.csv("csv/contribution.csv")

don[1:5,]

str(don)

# data dictionary

# Gender
# Class.Year      
# Marital.Status 
# Major
# Next.Degree
# FY04Giving   - contributions in that year   
# FY03Giving   - contributions in that year
# FY02Giving   - contributions in that year
# FY01Giving   - contributions in that year     
# FY00Giving   - contributions in that year
# AttendenceEvent

## year count

plyr::count(don,"Class.Year")

barchart(table(don$Class.Year),
         horizontal = F,
         xlab = "Class Year",
         col = "dark green")

## other variables

histogram(~FY04Giving|Marital.Status, 
          data = don,
          layout = c(1,5),
          col="black")
