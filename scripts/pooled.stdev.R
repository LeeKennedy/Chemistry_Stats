#Data input as sets of raw data, with headers but rows unlabelled.

library(dplyr)

psd <- read.csv("/Users/Study Old/Documents/GitHub/Chemistry_Stats/data/Test_equiv.csv", as.is=TRUE, header=TRUE)

psd <- na.omit(stack(psd))

psd1 <-  psd %>%
      group_by(ind)%>%
      summarise(mean = mean(values), sd = sd(values), n()-1)

colnames(psd1)[4] <- "df"

pooledSD <- sqrt( sum(psd1$sd^2 * psd1$df) / sum(psd1$df) )

psd1
pooledSD
