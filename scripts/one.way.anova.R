library(foreign)
library(car)
library(psych)
library(dplyr)
library(tidyr)

#SPSS demo data ----------------------------------------------------------
data.in <- read.spss("/Users/Study Old/Documents/GitHub/Chemistry_Stats/data/Work7.sav")

#Convert to dataframe ----------------------------------------------------
data.in2 <- as.data.frame(data.in)

# For the exercise - convert to wide data --------------------------------
data2 <- data.in2 %>% group_by(CITY) %>% mutate(Item = seq_along(CITY))
wide_data <- spread(data2, CITY, COST, fill = "")
wide_data

# Convert back to stacked data -------------------------------------------
data.in3 <- stack(wide_data[,c(2:5)])
data.in3$values <- as.numeric(data.in3$values)

# Describe the data ------------------------------------------------------
describeBy(data.in3$values, data.in3$ind)

# View the data ----------------------------------------------------------
boxplot(values~ind, data = data.in3)

# Check for homogeneity of variance --------------------------------------
leveneTest(data.in3$values,data.in3$ind)

# Perform ANOVA ----------------------------------------------------------
anova_example <- aov(values~ind, data=data.in3)
summary(anova_example)

# Check for significant differences --------------------------------------
TukeyHSD(anova_example)
