#' Bar mark
#'
#' @param vl def
#' @param orient def
#' @param stack def
#' @param size def
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
#' @examples
#' dat <- jsonlite::fromJSON('[
#'     {"a": "A","b": 28}, {"a": "B","b": 55}, {"a": "C","b": 43},
#'     {"a": "D","b": 91}, {"a": "E","b": 81}, {"a": "F","b": 53},
#'     {"a": "G","b": 19}, {"a": "H","b": 87}, {"a": "I","b": 52}
#'   ]')
#'
#' vegalite() %>%
#'   add_data(dat) %>%
#'   encode_x("a", "ordinal") %>%
#'   encode_y("b", "quantitative") %>%
#'   mark_bar()
mark_bar <- function(vl, orient=NULL, stack=NULL, size=NULL) {
  vl$x$mark <- "bar"
  if (!is.null(stack)) vl$x$config$mark$stacked <- stack
  if (!is.null(size)) vl$x$config$mark$barSize <- size
  if (!is.null(orient)) vl$x$config$mark$orient <- orient
  return(vl)
}

#' Circle mark
#'
#' @param size def
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   mark_circle()
mark_circle <- function(vl, size=30) {
  vl$x$mark <- "circle"
  vl$x$config$mark$size <- size
  return(vl)
}

#' Square mark
#'
#' @param size def
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
mark_square <- function(vl, size=30) {
  vl$x$mark <- "square"
  vl$x$config$mark$size <- size
  return(vl)
}

#' Tick mark
#'
#' @param vl def
#' @param orient def
#' @param size def
#' @param thickness def
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Cylinders", "ordinal") %>%
#'   mark_tick()
mark_tick <- function(vl, orient=NULL, size=NULL, thickness=1) {
  vl$x$mark <- "tick"
  vl$x$config$mark$tickThickness <- thickness
  if (!is.null(size)) vl$x$config$mark$tickSize <- size
  if (!is.null(orient)) vl$x$config$mark$orient <- orient
  return(vl)
}

#' Line mark
#'
#' @param vl def
#' @param orient def
#' @param interpolate def
#' @param tension def
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
mark_line <- function(vl, orient=NULL, interpolate=NULL, tension=NULL) {
  vl$x$mark <- "line"
  if (!is.null(interpolate)) vl$x$config$mark$interpolate <- interpolate
  if (!is.null(tension)) vl$x$config$mark$tension <- tension
  if (!is.null(orient)) vl$x$config$mark$orient <- orient
  return(vl)
}

#' Area mark
#'
#' @param vl def
#' @param orient def
#' @param stack def
#' @param interpolate def
#' @param tension def
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
mark_area <- function(vl, orient=NULL, stack=NULL, interpolate=NULL, tension=NULL) {
  vl$x$mark <- "area"
  if (!is.null(stack)) vl$x$config$mark$stacked <- stack
  if (!is.null(interpolate)) vl$x$config$mark$interpolate <- interpolate
  if (!is.null(tension)) vl$x$config$mark$tension <- tension
  if (!is.null(orient)) vl$x$config$mark$orient <- orient
  return(vl)
}

#' Point mark
#'
#' @param vl def
#' @param shape def
#' @param size def
#' @param tension def
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   mark_point()
mark_point <- function(vl, shape="circle", size=30) {
  vl$x$mark <- "point"
  vl$x$config$mark$shape <- shape
  vl$x$config$mark$size <- size
  return(vl)
}

#' Text mark
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
mark_text <- function(vl) {
  vl$x$mark <- "text"
  return(vl)
}

