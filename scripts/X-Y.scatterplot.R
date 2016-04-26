library(ggplot2)
library(readxl)

data.in <- read_excel("/Users/Study Old/Documents/GitHub/Chemistry_Stats/data/Book4.xlsx", sheet=1)
round(data.in,2)

# Conc-1 if you want the curve forced through zero
slp = lm(Abs ~ Conc, data = data.in)
summary(slp)

confint(slp)

dataplot = ggplot(data = data.in, aes(x = Conc, y = Abs)) + 
  geom_point(size=5, shape = 21, colour = "darkgreen") + 
  stat_smooth(method = "lm", fullrange = TRUE) +
  annotate("text", label = paste("R2 = ",round(summary(slp)$r.squared,digits=4)), x = 7.5, y = 6) +
  xlab("Values of X") +
  ylab("Values of Y") +
  geom_hline(yintercept = 0) +
  geom_vline(xintercept = 0) +
  theme_bw(base_size = 12, base_family = "Arial")+
        theme(panel.grid.major = element_line(size = 0.5, color = "grey"), 
              axis.line = element_line(size = 0.7, color = "black"), 
              text = element_text(size = 14))

dataplot


