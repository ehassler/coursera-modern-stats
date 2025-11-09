library(parallel)

# Always good to use less than all so the operating system doesn't lock
mc.cores <- detectCores() - 2
options(mc.cores=mc.cores)
cl <- makeCluster(mc.cores) 
cl

# makeCluster defaults to type='PSOCK' which is similar to makePSOCKcluster
# makeCluster(..., type='FORK') will use makeForkCluster and will cause an error on windows

# Default
RNGkind()
clusterEvalQ(cl, RNGkind())


clusterSetRNGStream(cl)
clusterEvalQ(cl, RNGkind())

# Each worker gets an element from the list and the function applied to it
clusterApplyLB(cl, LETTERS, function(letter){sprintf('%s%s', letter, letter)})
# Returns a list of results.  If the arguments are longer then the number of workers then workers are recycles
# clusterApplyLB will do it without the deterministic mapping of elements to workers (it's more as they become available)

# Evaluate an expression on each worker
clusterEvalQ(cl, library(MASS))  # Load a library on each worker
# Returns a list, each element is the return from a worker

f <- function(i){
	i^2
}

clusterExport(cl, list('f')) # Export f to the workers' global scope

f <- function(i){
	i^3
}
clusterEvalQ(cl, f)[[1]]  # Note that the workers still have the old f

parLapply(cl, 1:10, function(i){i}) # Executes in parallel

parLapply(cl, 1:10, function(i){f(i)}) # Note that it uses the version of f in global scope of the worker

pids <- parLapply(cl, 1:87, function(.){Sys.getpid()})
print(table(do.call(c, pids)))  # Each process got repeat usage

stopCluster(cl)