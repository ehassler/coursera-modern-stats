## Demo 4.2 Further examples of Wilkinson's notation and convenience functions

X <- model.matrix(Pull.Strength ~ Wire.Length + Die.Height, data=df)
X <- model.matrix(Pull.Strength ~ ., data=df)
X <- model.matrix(Pull.Strength ~ 0 + ., data=df)

standardize <- function(x){(x - mean(x))/sd(x)}
X <- model.matrix(Pull.Strength ~ standardize(Wire.Length) + I(Die.Height^2), data=df)
summary(X[,2])
sd(X[,2])