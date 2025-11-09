## Demo4.2 Linear Dependence

X <- data.frame(
	'(Intercept)' = rep(1, 6),
	'A'=rep(c(1,0,0), times=2),
	'B'=rep(c(0,1,0), times=2),
	'C'=rep(c(0,0,1), times=2),
	check.names=FALSE
)
y <- as.numeric(
	as.matrix(X) %*% matrix(c(1, 1, 1, 1), ncol=1)
)
y <- rnorm(6, y, 0.1)
summary(lm(y ~ . - 1, data=X))