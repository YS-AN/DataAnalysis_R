Division <- function(x, y) {
  return (x/y);
}

MultiCalculate <- function(x, y)
{
  val.sum <- x + y;
  val.mul <- x * y;
  
  return(list(sum = val.sum, mul = val.mul));
}