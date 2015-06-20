### AUTHOR
cachematrix.R - Tim Allen - (Forked from R.Peng 20 June 2015)

## PURPOSE.
The first two functions calculate and return the inverse of a matrix. A third function tests and times the first two functions.

## CACHING.
Matrix inversion is a time-consuming process, on my PC it takes 7.60 seconds of user time to invert a 1000x1000 matrix.

Therefore we cache the inverse of  a matrix when it is calculated, to avoid calculating it more than once. We retrieve this cached value once it is calculated, as long as the matrix is unchanged.

## FUNCTIONS.
There are three functions in this assignment:
I) makeCacheMatrix: This function allows us to create a new matrix. This matrix can return the cached version of its inverse.
II) cacheSolve: This function returns the inverse of a matrix created by makeCacheMatrix.  If the inverse has alread been calculated, cacheSolve returns the cached copy to save time.
III) testCachematrix: This function tests the other two functions by creating a million-cell random matrix and inverting it. It determines the user time in seconds necessary to run both the non-cached and cached operations to return the inverse.

## RESULTS.
A test run follows:

    > testCacheMatrix()
    [1] "1) Create a random million-cell matrix"
    [1] "2) cacheSolve(test.matrix) - Calculate the inverted matrix"
       user  system elapsed 
       7.83    0.04    8.66 
    [1] "3) cacheSolve(test.matrix) - The 2nd time retrieves from cache"
    getting cached data
       user  system elapsed 
          0       0       0 
    [1] "4) Test the result: doing matrix multiplication of the original matrix"
    [1] "with the inverted matrix should return the identity matrix."
          [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13] [,14]
     [1,]    1    0    0    0    0    0    0    0    0     0     0     0     0     0
     [2,]    0    1    0    0    0    0    0    0    0     0     0     0     0     0
     [3,]    0    0    1    0    0    0    0    0    0     0     0     0     0     0
     [4,]    0    0    0    1    0    0    0    0    0     0     0     0     0     0
     [5,]    0    0    0    0    1    0    0    0    0     0     0     0     0     0
     [6,]    0    0    0    0    0    1    0    0    0     0     0     0     0     0
     [7,]    0    0    0    0    0    0    1    0    0     0     0     0     0     0
     [8,]    0    0    0    0    0    0    0    1    0     0     0     0     0     0
     [9,]    0    0    0    0    0    0    0    0    1     0     0     0     0     0
    [10,]    0    0    0    0    0    0    0    0    0     1     0     0     0     0
    [11,]    0    0    0    0    0    0    0    0    0     0     1     0     0     0
    [12,]    0    0    0    0    0    0    0    0    0     0     0     1     0     0
    [13,]    0    0    0    0    0    0    0    0    0     0     0     0     1     0
    [14,]    0    0    0    0    0    0    0    0    0     0     0     0     0     1
    [15,]    0    0    0    0    0    0    0    0    0     0     0     0     0     0
    [16,]    0    0    0    0    0    0    0    0    0     0     0     0     0     0
    [17,]    0    0    0    0    0    0    0    0    0     0     0     0     0     0
    [18,]    0    0    0    0    0    0    0    0    0     0     0     0     0     0
    [19,]    0    0    0    0    0    0    0    0    0     0     0     0     0     0
    [20,]    0    0    0    0    0    0    0    0    0     0     0     0     0     0
