# How are exponential random variates generated?
rexp

# function (n, rate = 1) 
# 	.Call(C_rexp, n, 1/rate)
# <bytecode: 0x557b89b3f818>
# 	<environment: namespace:stats>

# `r-source/src/nmath/rexp.c` defines `C_rexp` as a call to `exp_rand()` in ./sexp.c
# `r-source/src/nmath/sexp.c` gives the explicit code and cites:
#  "Computer methods for sampling from the exponential and normal distributions"  Ahrens, J.H. and Dieter, U. (1972)

  
  