p1 <- c(rep(1,5), rep(0,5))
p2 <- c(rep(0,5), rep(1,5))

m <- matrix(NA, nrow=500, ncol=10)
for (i in 1:500) {
  if (i <= 250)
    p <- p1
  else
    p <- p2

  noisy_p <- ifelse(runif(10)<.20, 1-p, p)
  m[i,] <- noisy_p
}

write.csv(m, "noisy_bits.csv", row.names = F)
image(t(m))
