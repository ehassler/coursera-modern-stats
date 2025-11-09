# Dataframes and Lists


# Sequences- shorthand to make vectors
1:5
2:10
?`:` # for details
seq(from=5, to=1, by=-1)
seq(from=5, to=1, length.out=9)


# Matrices and Arrays - Multidimensional vectors
# A vector is single dimensional
# Matrix is 2d 
# Array is any number of dimensions
X <- matrix(1:9, nrow=3)
print(X)
X[1,]
X[,1]
X[2,2]

Y <- array(1:27, dim=c(3,3,3))
Y

Y[1,,]
Y[,1,]
Y[,,1]



# Special matrix things
X <- diag(c(1,2,3))
print(X)
Y <- matrix(c(0,1,0,1,0,0,0,0,1), ncol=3)
print(Y)
X %*% Y


# A vector, matrix, and array are all of the same type
# A list is a collection of things, pretty loosey goosey
x <- list(
	(1:10),
	function(w){
		return(w - 1)
	},
	'This is a string!'
)
str(x)


# Using single brackets returns a list with those elements
x[1]
class(x[1])
x[c(1,2)]

# Using double brackets gets the value
x[[1]]
class(x[[1]])
x[[2]](3)  # should be 2

# Lists can have names
names(x) <- c('vector', 'function', 'string')
str(x)
x[['vector']]
x$vector

# x <- `names<-`(x, c('vector', 'function', 'string'))

x <- list(
	'vector'=1:10,
	'function'=function(w){
		return(w - 1)
	},
	'string'='This is a string!'
)
str(x)


# DataFrames are the workhorse of R
# data.frame is a list of vectors with columns of the 
# same length, and a class of data.frame
x <- data.frame(
	'x1'=1:10,
	'x2'=(1:10)^2
)
str(x)

# Can access x as a list
x$x1
x[[1]]

# But also as a data frame
x[1,]
x[,1]

# Access is also a function!
str(x[1,1]) # So convenient, it knows we want a value!
str(x[1,1,drop=FALSE])
?`[`


