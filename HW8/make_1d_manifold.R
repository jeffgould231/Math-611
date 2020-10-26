library(ggplot2)
set.seed(123)

n <- 500
# start in 2d and make a horseshoe
beta = seq(0, 1, length.out = n)
x <- 5*sin(pi*beta)
y <- 2*(.5-beta) + 20*beta*(1-beta)*cos(pi*beta)

# add some noise
x <- x + rnorm(n, mean=0, sd=.2)
y <- y + rnorm(n, mean=0, sd=.2)

# verify horseshoe
g <- ggplot(data=data.frame(x=x, y=y, beta=beta)) + 
     geom_point(aes(x=x, y=y, color=beta)) + theme_bw()
print(g)

# now add 8 more dimensions
m <- matrix(c(x,y), nrow=n, ncol=2)
m <- cbind(m, matrix(0, nrow=n, ncol=8))

# and rotate so the students can't figure out that it's
# really in 2-d
Q <- qr.Q(qr(matrix(runif(100), nrow=10, ncol=10)))
m_rot <- t(Q %*% t(m))

write.csv(cbind(m_rot, beta), "diffusion_maps_data.csv", row.names=F)
