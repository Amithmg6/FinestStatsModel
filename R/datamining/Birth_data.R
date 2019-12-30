# 2006 Birth dataset

library(lattice)

library(nutshell)

data(births2006.smpl)

births2006.smpl[1:5,]

# data explained

# DOB_MM - day of birth month
# DOB_WK - day of week
# DBWT   - birth weight of the baby
# WTGAIN - the weight gain of the mother during pregnancy
# SEX    - the sex of the baby
# APGAR5 - APGAR score at birth
# DPLURAL- single or multiple birth
# ESTGEST- estimated gestation age in weeks

## Descriptive statistics on the data

str(births2006.smpl)

library(psych)

describe(births2006.smpl$DOB_MM)

describeBy(x = births2006.smpl$DOB_MM,
           group = births2006.smpl$DPLURAL)


## births

births_dow = table(births2006.smpl$DOB_WK)
births_dow

barchart(births_dow, 
         ylab="Day of week",
         col="green",
         main = "Day of Week")

dob_dm_tbl = table(wk=births2006.smpl$DOB_WK,
                   mm=births2006.smpl$DMETH_REC)

dob_dm_tbl

dob_dm_tbl = dob_dm_tbl[,-2]

## using trllis device()

trellis.device()

barchart(dob_dm_tbl, ylab="Day of Week")

barchart(dob_dm_tbl, horizontal = F,
         groups = F, 
         xlab="Day of Week",col = "black")


## single and multiple births vs weight gain

histogram(~DBWT|DPLURAL, 
          data = births2006.smpl,
          layout = c(1,5),
          col="black")

histogram(~DBWT|SEX, 
          data = births2006.smpl,
          layout = c(1,3),
          col="black")

histogram(~DBWT|DMETH_REC, 
          data = births2006.smpl,
          layout = c(1,3),
          col="black")

## density plots

densityplot(~DBWT|DPLURAL, 
            data = births2006.smpl,
            layout = c(1,5),
            plot.points=F,
            col="black")

densityplot(~DBWT, 
            groups = DPLURAL,
            data = births2006.smpl,
            # layout = c(1,5),
            plot.points=F)
            # col="black")


