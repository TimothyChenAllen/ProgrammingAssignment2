## These two functions calculate and return the inverse of a matrix.
## As this is a time-consuming process, we cache the inverse of
## a matrix when it is calculated, to avoid calculating it more than once.
## We retrieve this cached value once it is calculated, as long
## as the matrix is unchanged.

## makeCacheMatrix: This function allows us to create a new matrix.
## This matrix can return the cached version of its inverse.
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) i <<- solve
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## cacheSolve: This function returns the inverse of a matrix created
## by makeCacheMatrix.  If the inverse has alread been calculated,
## cacheSolve returns the cached copy to save time.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
