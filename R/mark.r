#' Bar mark
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
mark_bar <- function(vl) {
  vl$x$mark <- "bar"
  return(vl)
}

#' Circle mark
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
mark_circle <- function(vl) {
  vl$x$mark <- "cirlce"
  return(vl)
}

#' Square mark
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
mark_square <- function(vl) {
  vl$x$mark <- "square"
  return(vl)
}

#' Tick mark
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
mark_tick <- function(vl) {
  vl$x$mark <- "tick"
  return(vl)
}

#' Line mark
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
mark_line <- function(vl) {
  vl$x$mark <- "line"
  return(vl)
}

#' Area mark
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
mark_area <- function(vl) {
  vl$x$mark <- "area"
  return(vl)
}

#' Point mark
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
mark_point <- function(vl) {
  vl$x$mark <- "point"
  return(vl)
}

#' Text mark
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
mark_text <- function(vl) {
  vl$x$mark <- "text"
  return(vl)
}

