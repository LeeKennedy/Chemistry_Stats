library(psych)

# Enter data and selct single column.
data.in <- read.csv("/Users/Study Old/Documents/GitHub/Chemistry_Stats/data/Book1.csv", header=TRUE)

#data.in <- read.csv("C:/Users/lkennedy/OneDrive for Business 1/GitHub Projects/Chemistry_Stats/data/Book1.csv", header=TRUE)

data.in2 <- data.in[2]


colnames(data.in2)[1] <- "Data"
summary(data.in2)
describe(data.in2)

m <- describe(data.in2)$mean
n <- nrow(data.in2)/2
hist(data.in2$Data, breaks=n)

d <- density(data.in2$Data) # returns the density data 
plot(d)
abline(v=m, col = "red", lty=2)

qqnorm(data.in2$Data)
qqline(data.in2$Data, col = 2)

# Run as script or use File>Compile Notebook to get broad overview.