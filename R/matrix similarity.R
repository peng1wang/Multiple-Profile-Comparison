library(Matrix)
library(dynutils)
library(evmix)

data <- read.csv('/Users/mac/Desktop/profile monitoring/data/distance_matrix_monitor/Nw4000/distance4dpc.csv')

m <- matrix(data = 0, nrow = 23,ncol = 23)

for (i in 1:23)
{
  for (j in 1:23)
  {
    #150 for quantile
    cdf <- pbckden(data[,i][j], data[,i], lambda = 0.45, bcmethod="copula", xmax = max(data[,i]) + 100) #  0.5 and 0.3 # 100 and 0.1
    
    # 0.95
    if (cdf > 0.95){
      m[i,j] = 1
    }
    #m[i,j] = cdf
  }
}

write.table(m, "/Users/mac/Desktop/profile monitoring/data/distance_matrix_monitor/Nw4000/bckde_dpc_0.8_624.csv", row.names=FALSE, col.names=TRUE, sep=",")
