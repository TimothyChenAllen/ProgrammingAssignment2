# Test cachematrix.R
source("cachematrix.R")
nrow <- 1000
test.matrix <- makeCacheMatrix(matrix(rnorm(nrow * nrow),nrow=nrow))
# The first time we have to do the calculation
system.time(inverted.test.matrix <- cacheSolve(test.matrix))
# The second time we pull it from cache; it should be a lot faster
system.time(inverted.test.matrix <- cacheSolve(test.matrix))
# Let's check and see if the matrix created was really the
# inverse; the original matrix times its inverse
# should be equal to the identity matrix, I:
round(test.matrix$get() %*% inverted.text.matrix,5)[1:20,1:14]
