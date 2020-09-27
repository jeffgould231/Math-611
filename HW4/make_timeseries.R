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

# choose a base time series for each sample
assign_prob <- (1:K)/sum(1:K)
sample_assignment <- sample.int(K, N, replace = T, prob = assign_prob)

samples <- base_ts[sample_assignment,]
# add noise
samples <- samples + matrix(rnorm(K*N, mean=0, sd=2), nrow=N, ncol=n)

write.csv(samples, file="TimeSeries.csv", row.names = F)
write.csv(base_ts, file="BaseSeries.csv", row.names = F)

# plot base time series
plot(base_ts[1,], type="l", ylim=c(-12, 12))
for (i in 2:K)
  lines(base_ts[i,])

# plot samples
plot(samples[1,], type="l", ylim=c(-12, 12))
for (i in 2:N)
  lines(samples[i,])