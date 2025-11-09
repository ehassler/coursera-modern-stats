fit <- lm(dist ~ speed, data=cars)

class(fit) # What class names

?lm  # What package? stats::lm

methods(class='lm')  # plot is one of the methods

methods('plot') # lm is one of the classes dispatched by plot

stats::plot.lm  # this fails since plot.lm isn't exported from the package
stats:::plot.lm  # this works becaues it ignores what the package wants

par(mfrow=c(2,2))
plot(fit, ask=FALSE)

debug(plot)
plot(fit, ask=FALSE)

undebug(plot)
plot(fit, ask=FALSE)
