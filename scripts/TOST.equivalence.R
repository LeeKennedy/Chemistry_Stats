
library(equivalence)

data.in <- read.csv("/Users/Study Old/Documents/GitHub/Chemistry_Stats/data/Test_equiv.csv", as.is=TRUE, header=TRUE)
Col1 <- colnames(data.in)
colnames(data.in) <- c("A", "B")

#The tolerable difference between means.
epsilon <- 24

boxplot(data.in)



summary(data.in)

#  Ho = the two sets are different. (The revers to the normal Ho.)
#  H1 = the two sets are equivalent, being no more than epsilon apart.
# "Not rejected" means that we have not proven that the two sets are equivalent.
# "Rejected" means that there is enough evidence to say that the sets are equivalent, when we accept that equivalence is no more than 'epsilon' apart.

tost_xy <- tost(data.in$A, data.in$B, epsilon, conf.level = 0.95, var.equal = TRUE)
tost_xy






