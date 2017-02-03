#' Mark
#'
#' A bar mark represents each data point as a rectangle, where the length is
#' mapped to a quantitative scale.
#'
#' @param vl Vega-Lite object
#' @param mark can be "bar", "circle", "square", "tick", "line", "area", "point",
#'        and "text". These directly set how the data are drawn and are similar
#'        geoms in ggplot2.
#' @param filled,color,fill,stroke see \href{https://vega.github.io/vega-lite/docs/config.html#color}{config.mark color docs}
#' @param opacity,fillOpacity,strokeOpacity see \href{https://vega.github.io/vega-lite/docs/config.html#opacity}{config.mark opacity docs}
#' @param strokeWidth,strokeDash,strokeDashOffset see \href{https://vega.github.io/vega-lite/docs/config.html#stroke-style}{config.mark stroke docs}
#' @param stacked applicable only to bar and area \code{mark},
#'        "zero" (baseline offset at zero for stacked bar or area),
#'        "normalized", "center" (streamgraph), or "none".
#' @param interpolate,tension for line and area \code{mark}, the line interpolation method.
#'        value for interpolate can be "linear", "step-before", "step-after",
#'        "basis", "basis-open", "basis-closed", "bundle", "cardinal",
#'        "cardinal-open", "cardinal-closed", or "monotone", For tension, see
#'        \href{https://github.com/mbostock/d3/wiki/SVG-Shapes#line_interpolate}{D3's line interpolation}.
#' @param orient the orientation of a non-stacked bar, area, and line charts.
#'        The value is either "horizontal", or "vertical" (default). For bar and
#'        tick, this determines whether the size of the bar and tick should be
#'        applied to x or y dimension. For area, this property determines the
#'        orient property of the Vega output. For line, this property determines
#'        the path order of the points in the line if path channel is not specified.
#'        For stacked charts, this is always determined by the orientation of the stack;
#'        therefore explicitly specified value will be ignored.
#' @param barSize the size of the bars (width or height depending on \code{orient})
#' @param shape applicable to point \code{mark}, "circle", "square", "cross", "diamond",
#'        "triangle-up", or "triangle-down", or else a custom SVG path string.
#' @param size for point, circle or square \code{mark}, the pixel area of a point.
#' @param tickSize the size of ticks
#' @param tickThickness the thickness of ticks.
#' @rdname mark
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec},
#' \href{https://vega.github.io/vega-lite/docs/config.html#mark-config}{Vega-Lite config.mark spec}
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
mark <- function(vl, mark="circle", filled=NULL, color=NULL, fill=NULL,
                 stroke=NULL, opacity=NULL, fillOpacity=NULL,
                 strokeOpacity=NULL, strokeWidth=NULL, strokeDash=NULL,
                 strokeDashOffset=NULL, stacked=NULL, interpolate=NULL,
                 tension=NULL, orient=NULL, barSize=NULL, shape=NULL, size=NULL,
                 tickSize=NULL, tickThickness=NULL) {

  vl$x$mark <- mark

  if (!is.null(filled))           vl$x$config$mark$filled <- filled
  if (!is.null(color))            vl$x$config$mark$color <- color
  if (!is.null(fill))             vl$x$config$mark$fill <- fill
  if (!is.null(stroke))           vl$x$config$mark$stroke <- stroke
  if (!is.null(opacity))          vl$x$config$mark$opacity <- opacity
  if (!is.null(fillOpacity))      vl$x$config$mark$fillOpacity <- fillOpacity
  if (!is.null(strokeOpacity))    vl$x$config$mark$strokeOpacity <- strokeOpacity
  if (!is.null(strokeWidth))      vl$x$config$mark$strokeWidth <- strokeWidth
  if (!is.null(strokeDash))       vl$x$config$mark$strokeDash <- strokeDash
  if (!is.null(strokeDashOffset)) vl$x$config$mark$strokeDashOffset <- strokeDashOffset

  if (mark %in% c("bar", "area")) {
    if (!is.null(stacked))        vl$x$config$mark$stacked <- stacked
  }

  if (mark %in% c("line", "area")){
    if (!is.null(interpolate))    vl$x$config$mark$interpolate <- interpolate
    if (!is.null(tension))        vl$x$config$mark$tension <- tension
  }

  if (mark %in% c("bar", "area", "line")) {
    if (!is.null(orient))         vl$x$config$mark$orient <- orient
  }

  if (mark == "bar") {
    if (!is.null(barSize))        vl$x$config$mark$barSize <- barSize
  }
  if (mark == "point") {
    if (!is.null(shape))          vl$x$config$mark$shape <- shape
  }

  if (mark %in% c("point", "circle", "square")) {
    if (!is.null(size))           vl$x$config$mark$size <- size
  }

  if (mark == "tick"){
    if (!is.null(tickSize))       vl$x$config$mark$tickSize <- tickSize
    if (!is.null(tickThickness))  vl$x$config$mark$tickThickness <- tickThickness
  }

  return(vl)
}

#' @rdname mark
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   mark_circle()
mark_bar <- function(vl, ...) {
  vl <- mark(vl, mark="bar", ...)
  return(vl)
}
#' @rdname mark
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   mark_circle()
mark_circle <- function(vl, ...) {
  vl <- mark(vl, mark="circle", ...)
  return(vl)
}

#' @rdname mark
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   mark_square()
mark_square <- function(vl, ...) {
  vl <- mark(vl, mark="square", ...)
  return(vl)
}

#' @rdname mark
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Cylinders", "ordinal") %>%
#'   mark_tick()
mark_tick <- function(vl, ...){
  vl <- mark(vl, mark="tick", ...)
  return(vl)
}

#' @rdname mark
#' @export
#' @examples
#' vegalite() %>%
#'   cell_size(300, 300) %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/driving.json") %>%
#'   encode_x("miles", "quantitative") %>%
#'   encode_y("gas", "quantitative") %>%
#'   encode_path("year", "temporal") %>%
#'   scale_x_linear(zero=FALSE) %>%
#'   scale_y_linear(zero=FALSE) %>%
#'   mark_line()
mark_line <- function(vl, ...) {
  vl <- mark(vl, mark="line", ...)
  return(vl)
}

#' @rdname mark
#' @export
#' @examples
#' vegalite() %>%
#'   cell_size(300, 200) %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json") %>%
#'   encode_x("date", "temporal") %>%
#'   encode_y("count", "quantitative", aggregate="sum") %>%
#'   encode_color("series", "nominal") %>%
#'   scale_color_nominal(range="category20b") %>%
#'   timeunit_x("yearmonth") %>%
#'   scale_x_time(nice="month") %>%
#'   axis_x(axisWidth=0, format="%Y", labelAngle=0) %>%
#'   mark_area()
mark_area <- function(vl, ...) {
  vl <- mark(vl, mark="area", ...)
  return(vl)
}

#' @rdname mark
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   mark_point()
mark_point <- function(vl, ...) {
  vl <- mark(vl, mark="point", ...)
  return(vl)
}

#' @rdname mark
#' @export
#' @examples
#' vegalite() %>%
#'   cell_size(300, 200) %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   encode_color("Origin", "nominal") %>%
#'   calculate("OriginInitial", "datum.Origin[0]") %>%
#'   encode_text("OriginInitial", "nominal") %>%
#'   mark_text()
mark_text <- function(vl, ...) {
  vl <- mark(vl, mark="text", ...)
  return(vl)
}
