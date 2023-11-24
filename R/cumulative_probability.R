library(Matrix)
library(dynutils)
library(evmix)

data1 <- read.csv('/Users/mac/Desktop/profile monitoring/new_dataset0915/distance4BCKDECumulative.csv')

data2 <- read.csv('/Users/mac/Desktop/profile monitoring/new_dataset0915/data4BCKDECumulative.csv')

m <- matrix(data = 0, nrow = 1000,ncol = 2)

for (i in 1:1000)
{
  m[i,1] <- pbckden(data2[i,1], data1[, 1], lambda = 0.5, bcmethod="copula", xmax = max(data2[,1]), )
}

for (i in 1:1000)
{
  m[i,2] <- pbckden(data2[i,2], data1[, 2], lambda = 0.5, bcmethod="copula", xmax = max(data2[,2]), )
}

write.table(m, "/Users/mac/Desktop/profile monitoring/new_dataset0915/cumulativeplot4bckde_bw0.8.csv", row.names=FALSE, col.names=TRUE, sep=",")
