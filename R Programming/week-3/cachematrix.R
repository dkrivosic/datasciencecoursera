## Functions implement operations used for creating matrix
## and computing and caching its inverse matrix.

## Creates object that represents matrix which can cache its inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
     inverse <- NULL
     
     set <- function(m) {
          x <<- m
          inverse <<- NULL
     }
     
     get <- function() x
     setinverse <- function(m) inverse <<- m
     getinverse <- function() inverse
     
     list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Returns matrix that is inverse of x. If the inverse is cached, it returns cached
## value, otherwise it computes, caches and returns computed inverse matrix.

cacheSolve <- function(x, ...) {
     inverse <- x$getinverse()
     
     if(is.null(inverse)) {
          m <- x$get()
          inverse <- solve(m)
          x$setinverse(inverse)
     }
     
     x$getinverse()
}