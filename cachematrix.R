## cachematrix.R - Tim Allen - 20 June 2015

## PURPOSE. The first two functions calculate and return the inverse 
## of a matrix. A third function tests and times the first two functions.

## CACHING. Matrix inversion is a time-consuming process, on my PC it takes
## 7.60 seconds of user time to invert a 1000x1000 matrix.

## Therefore we cache the inverse of  a matrix when it is calculated, to avoid
## calculating it more than once. We retrieve this cached value once it is
## calculated, as long as the matrix is unchanged.

## FUNCTIONS.  There are three functions in this file:
## I) makeCacheMatrix: This function allows us to create a new matrix.
## This matrix can return the cached version of its inverse.
makeCacheMatrix <- function(x = matrix()) {
  # cached.inverted.x contains the inverse of the matrix.
  # It is local to this environment. We initialize it to NULL.
  cached.inverted.x <- NULL
  
  # makeCacheMatrix returns a list containing four elements:
  # 1) set: a function that sets the cached value of the matrix, 
  #         and clears the inverse i
  set <- function(y) {
    x <<- y
    cached.inverted.x <<- NULL
  }
  
  # 2) get: a function that returns the value of the matrix.
  get <- function() x

  # 3) setinverse: a function that sets the local cached
  #    version of 'cached.inverted.x' to the computed inverted matrix.
  setinverse <- function(solved.inversion) cached.inverted.x <<- solved.inversion
  
  # 4) getinverse: a function that returns the inverted matrix.
  getinverse <- function() cached.inverted.x
  
  # We return the four elements of this list:
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## II) cacheSolve: This function returns the inverse of a matrix created
## by makeCacheMatrix.  If the inverse has alread been calculated,
## cacheSolve returns the cached copy to save time.
cacheSolve <- function(x, ...) {
  # cacheSolve returns the matrix that is the inverse of 'x'
  
  # 1) Use the element 'getinverse' of the matrix
  #    to return the cached value of the inverted matrix
  inverted.x <- x$getinverse()
  # 2) If the returned value is not null, we return it
  #    and we're done (saving about 7.60 secs of user time on my PC!)
  if(!is.null(inverted.x)) {
    message("getting cached data")
    return(inverted.x)
  }
  # 3) If the returned value was not null, we use the 'solve'
  #   function to calculate the matrix inverse.
  data <- x$get()
  inverted.x <- solve(data, ...)
  
  # 4) We set the value of inverted.x back in the original matrix
  x$setinverse(inverted.x)
  
  # 5) Return the value of the inverted matrix
  inverted.x
}


## III) testCachematrix: This function tests the other two functions
## by creating a million-cell random matrix and inverting it.
## It determines the user time in seconds necessary to run both 
## the non-cached and cached operations to return the inverse.
testCacheMatrix <- function() {
  # 1) Create a random million-cell matrix
  print("1) Create a random million-cell matrix")
  nrow <- 1000
  test.matrix <- makeCacheMatrix(matrix(rnorm(nrow * nrow),nrow=nrow))
  
  # 2) Time the creation of the inverse matrix;
  #    The first time we have to do the calculation, which takes
  #    a mean of 7.60 seconds of user time as measured by system.time
  print("2) cacheSolve(test.matrix) - Calculate the inverted matrix")
  print(system.time(inverted.test.matrix <- cacheSolve(test.matrix)))
  # 3) The second time we pull it from cache; this takes an mean
  #    of 0.01 seconds of user time.
  print("3) cacheSolve(test.matrix) - The 2nd time retrieves from cache")
  print(system.time(inverted.test.matrix <- cacheSolve(test.matrix)))
  
  # 4) Let's check and see if the matrix created was really the
  # inverse; the original matrix times its inverse
  # should be equal to the identity matrix, I:
  print("4) Test the result: doing matrix multiplication of the original matrix")
  print("with the inverted matrix should return the identity matrix.")
  print(round(test.matrix$get() %*% inverted.test.matrix,5)[1:20,1:14])
}