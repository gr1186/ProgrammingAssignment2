##Ultimately, these functions work together to calculate the inverse of a matrix##using cache functionality to reduce computation time and overhead.  They make ##use of scoping rules in R to preserve state inside of an object.


##This function creates a special vector, sets the value, gets the value, then  ##sets the value of the inverse of the matrix, and gets the value of the inverse##of the matrix.

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
}
get<-function() x
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
list(set=set, get=get,
     setmatrix=setmatrix,
     getmatrix=getmatrix)

}


##This function takes as input a matrix and calculates the inverse of the matrix##but it first checks to see if it has already been calculated.  If it has, it  ##uses the inverse of the matrix from the cache and skips the calculation.

cacheSolve <- function(x=matrix(), ...) {
    m<-x$getmatrix()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
    matrix<-x$get()
    m<-solve(matrix, ...)
    x$setmatrix(m)
    m
}
