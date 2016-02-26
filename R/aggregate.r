#' @export
aggregate_x <- function(vl, operation) {
  vl$x$encoding$x$aggregate <- operation
  vl
}

#' @export
aggregate_y<- function(vl, operation) {
  vl$x$encoding$y$aggregate <- operation
  vl
}

#' @export
aggregate_size<- function(vl, operation) {
  vl$x$encoding$size$aggregate <- operation
  vl
}