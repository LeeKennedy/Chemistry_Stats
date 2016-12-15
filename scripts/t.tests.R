library(foreign)

data.in <- read.spss("/Users/Study Old/Documents/GitHub/Chemistry_Stats/data/Work6.sav")

# One sample t-Test
#To test if there is a significant difference between the mean of WITHADD and a estimated mean of 10.5:
# WITHADD = with fuel additive; WITHOUT = without fuel additive
# CARTYPE = manual or automatic
        
boxplot(data.in$WITHADD)
abline(h=10.5, col="red", lty=2)
t.test(data.in$WITHADD, mu = 10.5)

# Repeated Measures t-Test
# To test if there is a difference between two successive measure, post treatment.
t1 <- data.in$WITHADD
t2 <- data.in$WITHOUT

boxplot(t1, t2)

t3 <- cbind(t1,t2)
summary(t3)

t.test(t2, t1, paired = TRUE)

# Independent Groups t-Test
# To test means, grouped by factors
t.test(t1 ~ data.in$CARTYPE)
t.test(t2 ~ data.in$CARTYPE)
