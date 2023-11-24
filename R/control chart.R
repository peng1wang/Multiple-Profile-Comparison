library(Matrix)
library(dynutils)
library(evmix)

#data1 <- read.csv('/Users/mac/Desktop/profile monitoring/data/control chart/distance4dpc.csv')
data1 <- read.csv('/Users/mac/Desktop/profile monitoring/data/distance_matrix_monitor/Nw4000/distance4dpc.csv')
data2 <- read.csv('/Users/mac/Desktop/profile monitoring/data/control chart/simulation4dpc_nw4000.csv')

m <- matrix(data = 0, nrow = 1000,ncol = 23)

for (i in 1:23)
{
  distance <- data1[,i]
  for (j in 1:1000)
  {
    m[j,i] <- pbckden(data2[j,i], distance, lambda = 0.45, bcmethod="copula", xmax = max(data2[,i]),)
  } 
}

write.table(m, "/Users/mac/Desktop/profile monitoring/data/control chart/controlchart4dpc_nw4000.csv", row.names=FALSE, col.names=TRUE, sep=",")