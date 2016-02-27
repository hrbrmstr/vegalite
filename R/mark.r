#' Bar mark
#'
#' The bar mark represents each data point as a rectangle, where the length is
#' mapped to a quantitative scale.
#'
#' @param vl Vega-Lite object
#' @param orient the orientation of the axis. One of top or bottom for y and row
#'        channels, and left or right for x and column channels. Default value:
#'        x axis is placed on the bottom, y axis is placed on the left, column”s
#'        x-axis is placed on the top, row”s y-axis is placed on the right.
#' @param stack stacking modes for bar and area marks. \code{zero} - stacking
#'        with baseline offset at zero value of the scale (for creating typical stacked
#'        bar and area chart). \code{normalize} - stacking with normalized domain (for
#'        creating normalized stacked bar and area chart). \code{center} - stacking
#'        with center baseline (for streamgraph). \code{none} - No-stacking. This will
#'        produces layered bar and area chart.
#' @param size The pixel area each the point. For example: in the case of circles,
#'        the radius is determined in part by the square root of the size value.
#' @param opacity \code{0.0}-\code{1.0}
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
mark_bar <- function(vl, orient=NULL, stack=NULL, size=NULL, opacity=NULL) {
  vl$x$mark <- "bar"
  if (!is.null(stack)) vl$x$config$mark$stacked <- stack
  if (!is.null(size)) vl$x$config$mark$barSize <- size
  if (!is.null(orient)) vl$x$config$mark$orient <- orient
  if (!is.null(opacity)) vl$x$config$mark$opacity <- opacity
  return(vl)
}

#' Circle mark
#'
#' circle and square marks are similar to point mark, except that (1) the shape
#' value is always set to circle or square (2) they are filled by default.
#'
#' @param size The pixel area each the point. For example: in the case of circles,
#'        the radius is determined in part by the square root of the size value.
#' @param opacity \code{0.0}-\code{1.0}
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   mark_circle()
mark_circle <- function(vl, size=NULL, opacity=NULL) {
  vl$x$mark <- "circle"
  vl$x$config$mark$size <- size
  if (!is.null(opacity)) vl$x$config$mark$opacity <- opacity
  return(vl)
}

#' Square mark
#'
#' circle and square marks are similar to point mark, except that (1) the shape
#' value is always set to circle or square (2) they are filled by default.
#'
#' @param size The pixel area each the point. For example: in the case of circles,
#'        the radius is determined in part by the square root of the size value.
#' @param opacity \code{0.0}-\code{1.0}
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
mark_square <- function(vl, size=NULL, opacity=NULL) {
  vl$x$mark <- "square"
  vl$x$config$mark$size <- size
  if (!is.null(opacity)) vl$x$config$mark$opacity <- opacity
  return(vl)
}

#' Tick mark
#'
#' The tick mark represents each data point as a short line. This is a useful
#' mark for displaying the distribution of values in a field.
#'
#' @param vl Vega-Lite object
#' @param orient the orientation of the axis. One of top or bottom for y and row
#'        channels, and left or right for x and column channels. Default value:
#'        x axis is placed on the bottom, y axis is placed on the left, column”s
#'        x-axis is placed on the top, row”s y-axis is placed on the right.
#' @param size The pixel area each the point. For example: in the case of circles,
#'        the radius is determined in part by the square root of the size value.
#' @param thickness Thickness of the tick mark. Default value: 1
#' @param opacity \code{0.0}-\code{1.0}
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Cylinders", "ordinal") %>%
#'   mark_tick()
mark_tick <- function(vl, orient=NULL, size=NULL, thickness=1, opacity=NULL) {
  vl$x$mark <- "tick"
  vl$x$config$mark$tickThickness <- thickness
  if (!is.null(size)) vl$x$config$mark$tickSize <- size
  if (!is.null(orient)) vl$x$config$mark$orient <- orient
  if (!is.null(opacity)) vl$x$config$mark$opacity <- opacity
  return(vl)
}

#' Line mark
#'
#' The line mark represents the data points stored in a field with a line
#' connecting all of these points. Unlike other marks except area that represents
#' one data element per mark, one line mark represent multiple data element as
#' a single line.
#'
#' @param vl Vega-Lite object
#' @param orient the orientation of the axis. One of top or bottom for y and row
#'        channels, and left or right for x and column channels. Default value:
#'        x axis is placed on the bottom, y axis is placed on the left, column”s
#'        x-axis is placed on the top, row”s y-axis is placed on the right.
#' @param interpolate The line interpolation method to use. One of \code{linear}
#'         \code{step-before}, \code{step-after}, \code{basis}, \code{basis-open},
#'         \code{basis-closed}, \code{bundle}, \code{cardinal}, \code{cardinal-open},
#'         \code{cardinal-closed}, \code{monotone}. For more information about each
#'         interpolation method, please see D3’s line interpolation.
#' @param tension Depending on the interpolation type, sets the tension parameter.
#'        (See D3’s line interpolation.)
#' @param opacity \code{0.0}-\code{1.0}
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
mark_line <- function(vl, orient=NULL, interpolate=NULL, tension=NULL, opacity=NULL) {
  vl$x$mark <- "line"
  if (!is.null(interpolate)) vl$x$config$mark$interpolate <- interpolate
  if (!is.null(tension)) vl$x$config$mark$tension <- tension
  if (!is.null(orient)) vl$x$config$mark$orient <- orient
  if (!is.null(opacity)) vl$x$config$mark$opacity <- opacity
  return(vl)
}

#' Area mark
#'
#' area represent multiple data element as a single area shape.
#'
#' @param vl Vega-Lite object
#' @param orient the orientation of the axis. One of top or bottom for y and row
#'        channels, and left or right for x and column channels. Default value:
#'        x axis is placed on the bottom, y axis is placed on the left, column”s
#'        x-axis is placed on the top, row”s y-axis is placed on the right.
#' @param stack stacking modes for bar and area marks. \code{zero} - stacking
#'        with baseline offset at zero value of the scale (for creating typical stacked
#'        bar and area chart). \code{normalize} - stacking with normalized domain (for
#'        creating normalized stacked bar and area chart). \code{center} - stacking
#'        with center baseline (for streamgraph). \code{none} - No-stacking. This will
#'        produces layered bar and area chart.
#' @param interpolate The line interpolation method to use. One of \code{linear}
#'         \code{step-before}, \code{step-after}, \code{basis}, \code{basis-open},
#'         \code{basis-closed}, \code{bundle}, \code{cardinal}, \code{cardinal-open},
#'         \code{cardinal-closed}, \code{monotone}. For more information about each
#'         interpolation method, please see D3’s line interpolation.
#' @param tension Depending on the interpolation type, sets the tension parameter.
#'        (See D3’s line interpolation.)
#' @param opacity \code{0.0}-\code{1.0}
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
mark_area <- function(vl, orient=NULL, stack=NULL, interpolate=NULL, tension=NULL,
                      opacity=NULL) {
  vl$x$mark <- "area"
  if (!is.null(stack)) vl$x$config$mark$stacked <- stack
  if (!is.null(interpolate)) vl$x$config$mark$interpolate <- interpolate
  if (!is.null(tension)) vl$x$config$mark$tension <- tension
  if (!is.null(orient)) vl$x$config$mark$orient <- orient
  if (!is.null(opacity)) vl$x$config$mark$opacity <- opacity
  return(vl)
}

#' Point mark
#'
#' point mark represents each data point with a symbol.
#'
#' @param vl Vega-Lite object
#' @param shape The symbol shape to use. One of \code{circle}, \code{square},
#'        \code{cross}, \code{diamond}, \code{triangle-up}, or \code{triangle-down}.
#'        Default value: \code{circle}.
#' @param size The pixel area each the point. For example: in the case of circles,
#'        the radius is determined in part by the square root of the size value.
#' @param tension Depending on the interpolation type, sets the tension parameter.
#'        (See D3’s line interpolation.)
#' @param opacity \code{0.0}-\code{1.0}
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   mark_point()
mark_point <- function(vl, shape="circle", size=NULL, opacity=NULL) {
  vl$x$mark <- "point"
  vl$x$config$mark$shape <- shape
  vl$x$config$mark$size <- size
  if (!is.null(opacity)) vl$x$config$mark$opacity <- opacity
  return(vl)
}

#' Text mark
#'
#' text mark represents each data point with a text instead of a point.
#'
#' @param opacity 0.0-1.0
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
mark_text <- function(vl, opacity=NULL) {
  vl$x$mark <- "text"
  if (!is.null(opacity)) vl$x$config$mark$opacity <- opacity
  return(vl)
}

