set.seed(12345)

n <- 20
K <- 4
N <- 1000

# create base time series
base_ts <- matrix(runif(K*n, min=-5, max=5), nrow=K, ncol=n)
# tweek a bit to make them easy to differentiate visually
base_ts[1,1:5] <- 0
base_ts[2,6:10] <- 0
base_ts[3,11:15] <- 0
base_ts[4,16:20] <- 0

for (K in 2:4) {
  base_K <- base_ts[1:K,]
  assign_prob <- (1:K)/sum(1:K)
  sample_assignment <- sample.int(K, N, replace = T, prob = assign_prob)

  samples <- base_K[sample_assignment,]
  samples <- samples + matrix(rnorm(n*N, mean=0, sd=2), nrow=N, ncol=n)

  file <- paste("TimeSeries_K", K, ".csv", sep="")

  write.csv(samples, file=file, row.names = F)
}
