#' General axis setttings
#'
#' @references \href{http://vega.github.io/vega-lite/docs/axis.html}{Vega-List Axis spec}
#' @export
axis_x <- function(vl, layer, offset, orient, axisWidth, format, labelAngle) {
  arg <- as.list(match.call())
  if ((length(arg) > 2) & ("vl" %in% names(arg))) {
    arg[[1]] <- NULL
    arg$vl <- NULL
    vl$x$encoding$x$axis <- arg
  }
  vl
}

#' General axis setttings
#'
#' @references \href{http://vega.github.io/vega-lite/docs/axis.html}{Vega-List Axis spec}
#' @export
axis_y <- function(vl, layer, offset, orient, axisWidth, format, labelAngle) {
  arg <- as.list(match.call())
  if ((length(arg) == 2) & ("vl" %in% names(arg))) {
    arg[[1]] <- NULL
    arg$vl <- NULL
    vl$x$encoding$y$axis <- arg
  }
  vl
}
