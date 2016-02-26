#' @export
interpolate_mark <- function(vl, how, tension=NULL) {
  vl$x$config$mark$interpolate <- how
  if (!is.null(tension)) vl$x$config$mark$tension <- tension
  vl
}
