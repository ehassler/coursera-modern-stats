# Simple operations


# Assignment
x <- 8
y <- x + 1

# Identifiers (dot is not special)
new.x <- 5	# OK!
new_x <- 6  # OK!
x1 <- 7  	# OK!
x1.2 <- 8 	# OK!
1x <- 9  	# No way!
.x <- 10 	# OK!
.1x <- 11 	# No way!


# Dark magic
# Anything between backticks is an identifier
`.1x` <- 12
`.1x` + 1


# Other methods of assignment (Don't use)
z = 5
7 -> x
p <<- 0.5 # Dark magic


# Call function
print(y)
sqrt(y)
abs(-6)


# Ask for help with ?
?sqrt


# Other arithmetic
x^2		# Exponentiation
9 / 4	# Division
9 %/% 4 # Integer division
9 %% 4  # Modulus
# Matrix multiplication is %*%


# Everything you do is a function
# Operators are functions!
3 + 4
`+`
`+`(3, 4)
?`+`
# ?`<<-`


# Strings
name1 <- "Edgar"
name2 <- 'Edgar'
name1 == name2

 
# Everything is a vector and c is for concatenation
length(12)
12[1]
length(c(12,23,34))


# This can be confusing for strings
length('Edgar')
nchar('Edgar')
names <- c('Alice', 'Bob', 'Charlize', 'Dan')
length(names)
nchar(names)


# Most functions can work on vectors of any length
sqrt(c(4, 9, 16))


# A vector is of a single type
c(1, 2, '3') # Gets type-shifted to accomodating type
c(0, 1, TRUE)


# You can make zero length vectors
x <- numeric(0)
length(x)
class(x)


# Access elements
x <- c(1, 2, 4, 8, 16, 32)
x[1]  	# First element is 1
x[3]
x[0] 	# Length 0 vector of the same type
x[7] 	# Or NA
x[c(1,3,5)] # Get the first, third, and fifth element
# We can also use true false for inclusion
x[c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE)]
# You can repeat things
x[c(1,1,1,2,3,4,5,6)]
# Indicies are recycled
x[c(TRUE, FALSE)]
x[c(TRUE, FALSE,TRUE, FALSE,TRUE, FALSE)]


# Vectorized arithmetic
x <- c(1, 1, 2, 1, 3)
y <- c(0, -1, 1, 4, 0)
x + y
x * y
x %o% y # Outer product (x * y')


x <- c(TRUE, FALSE , TRUE, TRUE, FALSE)
y <- c(TRUE, TRUE, FALSE, FALSE, FALSE)
x & y	# A vector of element-wise comparisons
x && y  # Only first value
x | y   # Vectorized or
x || y  # Only first value
?`|`


# Functions
pwr <- function(x, power=1){
	x^power
}
pwr(2)
pwr(2, 2)
pwr(2, power=3)
pwr(power=3, x=2)


