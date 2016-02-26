#' Bar mark
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
mark_bar <- function(vl) {
  vl$x$mark <- "bar"
  return(vl)
}

#' Circle mark
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   mark_circle()
mark_circle <- function(vl) {
  vl$x$mark <- "circle"
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
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Cylinders", "ordinal") %>%
#'   mark_tick()
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
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   mark_point()
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

