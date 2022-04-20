 
 ​#​############################################################################### 
 ​#​# 
 ​#​#    Efficient repeated calculation of matrix inverses through caching 
 ​#​# 
 ​#​# This program implements a time-saving technique for computing the inverse 
 ​#​# of a matrix in situations where the inverse may need to be calculated 
 ​#​# repeatedly for the same matrix. The inverse is stored in a "cache" the  
 ​#​# first time it is calculated, so that whenever it is needed again it can 
 ​#​# simply be retrieved from the cache instead of having to be re-calculated. 
  
  
  
 ​#​############################################################################### 
 ​#​# 
 ​#​# cacheMatrix 
 ​#​# 
 ​#​# The makeCacheMatrix function creates a special "cache matrix" (or, if applied 
 ​#​# to an ordinary matrix, converts it into a "cache matrix"). The cache matrix 
 ​#​# is a list which contains the following four functions: 
 ​#​# 
 ​#​#  set: sets the value of the matrix (which is stored as a local variable) 
 ​#​#  get: retrieve the internally stored value of the matrix 
 ​#​#  setInverse: sets the value of the internally stored inverse of the matrix 
 ​#​#  getInverse: retrieve the value of the inverse of the matrix 
  
 ​makeCacheMatrix​ ​<-​ ​function​(​x​ ​=​ ​matrix​())  
 ​{ 
 ​  ​i​ ​<-​ ​NULL 
 ​  ​set​ ​<-​ ​function​(​y​)  
 ​  { 
 ​    ​x​ ​<<-​ ​y 
 ​    ​i​ ​<<-​ ​NULL 
 ​  } 
 ​  ​get​ ​<-​ ​function​() ​x 
 ​  ​setinverse​ ​<-​ ​function​(​inv​) ​i​ ​<<-​ ​inv 
 ​  ​getinverse​ ​<-​ ​function​() ​i 
 ​  ​list​(​set​ ​=​ ​set​, ​get​ ​=​ ​get​, 
 ​       ​setinverse​ ​=​ ​setinverse​, 
 ​       ​getinverse​ ​=​ ​getinverse​) 
 ​} 
  
 ​#​########################################################################### 
 ​#​# 
 ​#​# cacheSolve 
 ​#​# 
 ​#​# cacheSolve is applied to a cacheMatrix and returns a matrix that is the  
 ​#​# inverse of the internally stored matric in the cacheMatrix. 
 ​#​# cacheSolve works by retrieving the cached inverse in the cacheMatrix. 
 ​#​# If this is not null, it means that the inverse has previously been calculated 
 ​#​# and stored in the cache. A message is displayed and the stored inverse is returned.  
 ​#​# If the inverse has not already been calculated, solve() is used to calculate  
 ​#​# it, and it is stored in the cacheMatrix object as well as being returned. 
  
 ​cacheSolve​ ​<-​ ​function​(​x​, ​...​)  
 ​{ 
 ​  ​i​ ​<-​ ​x​$​getinverse() 
 ​  ​if​(​!​is.null(​i​)) 
 ​  { 
 ​    message(​"​getting cached data​"​) 
 ​    ​return​(​i​) 
 ​  } 
 ​  ​data​ ​<-​ ​x​$​get() 
 ​  ​i​ ​<-​ solve(​data​, ​...​) 
 ​  ​x​$​setinverse(​i​) 
 ​  ​i 
 ​} 
  
  
 ​#​################################### 
 ​#​# Demonstration code 
  
 ​myMatrix​ ​<-​ makeCacheMatrix()  ​#​ create an empty cacheMatrix 
 ​myMatrix​$​get()                 ​#​ retrieve the internally stored matrix (it is empty) 
 ​myMatrix​$​getinverse()          ​#​ retrieve its cached inverse (NULL) 
  
 ​myMatrix​$​set(​matrix​(c(​1​,​2​,​4​,​5​),​nrow​=​2​,​ncol​=​2​))   ​#​ set the value of the matrix 
 ​myMatrix​$​get()                                   ​#​ retrieve the stored matrix 
 ​myMatrix​$​getinverse()                            ​#​ retrieve the cached inverse (NULL) 
  
 ​cacheSolve(​myMatrix​)   ​#​ call cacheSolve: this computes and returns the inverse 
 ​myMatrix​$​getinverse()  ​#​ retrieve the cached inverse (same value previously returned) 
  
 ​cacheSolve(​myMatrix​)   ​#​ call cacheSolve again: message is shown and cached value returned 
  
 
