#' @export
timeunit_x <- function(vl, unit) {
  vl$x$encoding$x$timeUnit <- unit
  vl
}

#' @export
timeunit_y <- function(vl, unit) {
  vl$x$encoding$y$timeUnit <- unit
  vl
}
