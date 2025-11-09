# Demo 3.3 - rgl plot of Incontinence Data and Separating Hyperplane
setwd('/Users/Presentation/Desktop/Content/Demos')
options(warn=0)
library(rgl)


df <- read.csv('../data/Incontinence.csv')


# Construct the separating hyperplane

f <- function(beta){
	beta[c(2,3,4)] <- beta[c(2,3,4)] / sqrt(sum(beta[c(2,3,4)]^2))
	nu <- beta[1] + beta[2] * df[,'x1'] + beta[3] * df[,'x2'] + beta[4] * df[,'x3']
	sum(c(
		-nu[df[,'y'] == 0 & nu <= 1e-8],
		nu[df[,'y'] == 1 & nu >= -1e-8]
	))
}

fit <- optim(
	c(0, rnorm(3)),
	fn=f,
	method='Nelder-Mead'
)
gfit <- fit$par
gfit <- gfit[c(2,3,4)] / sqrt(sum(gfit[c(2,3,4)]^2))


open3d()
plot3d(
	x=df[,'x1'], 
	y=df[,'x2'], 
	z=df[,'x3'], 
	type='s', 
	col=c('blue','orange')[df[,'y']+1], 
	size=1,
	xlab='x1', ylab='x2', zlab='x3'
)


open3d()
plot3d(
	x=df[,'x1'], 
	y=df[,'x2'], 
	z=df[,'x3'], 
	type='s', 
	col=c('blue','orange')[df[,'y']+1], 
	size=1,
	xlab='x1', ylab='x2', zlab='x3'
)

planes3d(
	gfit[2], gfit[3], gfit[4], gfit[1], 
	color='green',
	facets=NA
)

