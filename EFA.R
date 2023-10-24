# Install required packages
install.packages("psych")
install.packages("GPArotation")
install.packages("corrplot")

# Load necessary libraries
library(psych)
library(ggplot2)
library(GPArotation)
library(corrplot)

# Load the dataset from the specified file path
data <- read.csv("data.csv", header=TRUE, row.names=1)

# histogram
par(mfrow = c(5, 5))
for (i in 1:ncol(data)) {
  hist(data[, i], main=colnames(data)[i], xlim=c(1, 10), xlab=NA, breaks=seq(1, 10, by=1), col="lightblue", border="black")
}
par(mfrow = c(1, 1))

# correlation matrix
correlation_matrix <- cor(data)
corrplot(correlation_matrix, method = "color", is.corr = FALSE, tl.col = "black", addCoef.col = "black")

# KMO
KMO(data)

# Bartlett's sphericity test
cortest.bartlett(data)

# Perform parallel analysis to determine the optimal number of factors
parallel_result <- fa.parallel(data, main="Parallel Analysis", n.iter=100)
parallel_result

# Compute the Very Simple Structure (VSS) for further evaluation
vss_result <- VSS(data, use="complete.obs")
vss_result

# Factor analysis
result <- fa(data, nfactors=2, fm="ml", rotate="cluster")
print(result, digits=4, cut=0.3, sort=TRUE)
result <- fa(data, nfactors=3, fm="ml", rotate="cluster")
print(result, digits=4, cut=0.3, sort=TRUE)
result <- fa(data, nfactors=4, fm="ml", rotate="cluster")
print(result, digits=4, cut=0.3, sort=TRUE)
result <- fa(data, nfactors=5, fm="ml", rotate="cluster")
print(result, digits=4, cut=0.3, sort=TRUE)
result <- fa(data, nfactors=6, fm="ml", rotate="cluster")
print(result, digits=4, cut=0.3, sort=TRUE)

result <- fa(data, nfactors=5, fm="ml", rotate="geominQ")
print(result, digits=4, cut=0.3, sort=TRUE)

result <- fa(data, nfactors=5, fm="ml", rotate="oblimin")
print(result, digits=4, cut=0.3, sort=TRUE)
