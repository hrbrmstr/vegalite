#' Bar mark
#'
#' A bar mark represents each data point as a rectangle, where the length is
#' mapped to a quantitative scale.
#'
#' @param vl Vega-Lite object
#' @param orient the orientation of a non-stacked bar, area, and line charts.
#'        The value is either "horizontal", or "vertical" (default). For bar and
#'        tick, this determines whether the size of the bar and tick should be
#'        applied to x or y dimension. For area, this property determines the
#'        orient property of the Vega output. For line, this property determines
#'        the path order of the points in the line if path channel is not specified.
#'        For stacked charts, this is always determined by the orientation of the stack;
#'        therefore explicitly specified value will be ignored.
#' @param stack stacking modes for bar and area marks. \code{zero} - stacking
#'        with baseline offset at zero value of the scale (for creating typical stacked
#'        bar and area chart). \code{normalize} - stacking with normalized domain (for
#'        creating normalized stacked bar and area chart). \code{center} - stacking
#'        with center baseline (for streamgraph). \code{none} - No-stacking. This will
#'        produces layered bar and area chart.
#' @param size The pixel area each the point. For example: in the case of circles,
#'        the radius is determined in part by the square root of the size value.
#' @param opacity \code{0.0}-\code{1.0}
#' @param filled whether the shape's color should be used as fill color instead of stroke color.
#' @param color  color of the mark – either fill or stroke color based on the filled mark config.
#' @param fill fill color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is true.
#' @param stroke stroke color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is false.
#' @encoding UTF-8
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
mark_bar <- function(vl, orient=NULL, stack=NULL, size=NULL, opacity=NULL,
                     filled=NULL, color=NULL, fill=NULL, stroke=NULL) {
  vl$x$mark <- "bar"
  if (!is.null(stack)) vl$x$config$mark$stacked <- stack
  if (!is.null(size)) vl$x$config$mark$barSize <- size
  if (!is.null(orient)) vl$x$config$mark$orient <- orient
  if (!is.null(opacity)) vl$x$config$mark$opacity <- opacity
  if (!is.null(filled)) vl$x$config$mark$filled <- filled
  if (!is.null(color)) vl$x$config$mark$color <- color
  if (!is.null(fill)) vl$x$config$mark$fill <- fill
  if (!is.null(stroke)) vl$x$config$mark$stroke <- stroke
  return(vl)
}

#' Circle mark
#'
#' Circle and square marks are similar to point mark, except that (1) the shape
#' value is always set to circle or square (2) they are filled by default.
#'
#' @param vl a Vega-Lite object
#' @param size The pixel area each the point. For example: in the case of circles,
#'        the radius is determined in part by the square root of the size value.
#' @param opacity \code{0.0}-\code{1.0}
#' @param filled whether the shape's color should be used as fill color instead of stroke color.
#' @param color  color of the mark – either fill or stroke color based on the filled mark config.
#' @param fill fill color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is true.
#' @param stroke stroke color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is false.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   mark_circle()
mark_circle <- function(vl, size=NULL, opacity=NULL,
                     filled=NULL, color=NULL, fill=NULL, stroke=NULL) {
  vl$x$mark <- "circle"
  vl$x$config$mark$size <- size
  if (!is.null(opacity)) vl$x$config$mark$opacity <- opacity
  if (!is.null(filled)) vl$x$config$mark$filled <- filled
  if (!is.null(color)) vl$x$config$mark$color <- color
  if (!is.null(fill)) vl$x$config$mark$fill <- fill
  if (!is.null(stroke)) vl$x$config$mark$stroke <- stroke
  return(vl)
}

#' Square mark
#'
#' Circle and square marks are similar to point mark, except that (1) the shape
#' value is always set to circle or square (2) they are filled by default.
#'
#' @param vl a Vega-Lite object
#' @param size The pixel area each the point. For example: in the case of circles,
#'        the radius is determined in part by the square root of the size value.
#' @param opacity \code{0.0}-\code{1.0}
#' @param filled whether the shape's color should be used as fill color instead of stroke color.
#' @param color  color of the mark – either fill or stroke color based on the filled mark config.
#' @param fill fill color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is true.
#' @param stroke stroke color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is false.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   mark_square()
mark_square <- function(vl, size=NULL, opacity=NULL,
                     filled=NULL, color=NULL, fill=NULL, stroke=NULL) {
  vl$x$mark <- "square"
  vl$x$config$mark$size <- size
  if (!is.null(opacity)) vl$x$config$mark$opacity <- opacity
  if (!is.null(filled)) vl$x$config$mark$filled <- filled
  if (!is.null(color)) vl$x$config$mark$color <- color
  if (!is.null(fill)) vl$x$config$mark$fill <- fill
  if (!is.null(stroke)) vl$x$config$mark$stroke <- stroke
  return(vl)
}

#' Tick mark
#'
#' A tick mark represents each data point as a short line. This is a useful
#' mark for displaying the distribution of values in a field.
#'
#' @param vl Vega-Lite object
#' @param orient the orientation of a non-stacked bar, area, and line charts.
#'        The value is either "horizontal", or "vertical" (default). For bar and
#'        tick, this determines whether the size of the bar and tick should be
#'        applied to x or y dimension. For area, this property determines the
#'        orient property of the Vega output. For line, this property determines
#'        the path order of the points in the line if path channel is not specified.
#'        For stacked charts, this is always determined by the orientation of the stack;
#'        therefore explicitly specified value will be ignored.
#' @param size The pixel area each the point. For example: in the case of circles,
#'        the radius is determined in part by the square root of the size value.
#' @param thickness Thickness of the tick mark. Default value: 1
#' @param opacity \code{0.0}-\code{1.0}
#' @param color  color of the mark – either fill or stroke color based on the filled mark config.
#' @param fill fill color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is true.
#' @param stroke stroke color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is false.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Cylinders", "ordinal") %>%
#'   mark_tick()
mark_tick <- function(vl, orient=NULL, size=NULL, thickness=1, opacity=NULL,
                      color=NULL, fill=NULL, stroke=NULL) {
  vl$x$mark <- "tick"
  vl$x$config$mark$tickThickness <- thickness
  if (!is.null(size)) vl$x$config$mark$tickSize <- size
  if (!is.null(orient)) vl$x$config$mark$orient <- orient
  if (!is.null(opacity)) vl$x$config$mark$opacity <- opacity
  if (!is.null(color)) vl$x$config$mark$color <- color
  if (!is.null(fill)) vl$x$config$mark$fill <- fill
  if (!is.null(stroke)) vl$x$config$mark$stroke <- stroke
  return(vl)
}

#' Line mark
#'
#' A line mark represents the data points stored in a field with a line
#' connecting all of these points. Unlike other marks except area that represents
#' one data element per mark, one line mark represent multiple data element as
#' a single line.
#'
#' @param vl Vega-Lite object
#' @param orient the orientation of a non-stacked bar, area, and line charts.
#'        The value is either "horizontal", or "vertical" (default). For bar and
#'        tick, this determines whether the size of the bar and tick should be
#'        applied to x or y dimension. For area, this property determines the
#'        orient property of the Vega output. For line, this property determines
#'        the path order of the points in the line if path channel is not specified.
#'        For stacked charts, this is always determined by the orientation of the stack;
#'        therefore explicitly specified value will be ignored.
#' @param interpolate The line interpolation method to use. One of \code{linear}
#'         \code{step-before}, \code{step-after}, \code{basis}, \code{basis-open},
#'         \code{basis-closed}, \code{bundle}, \code{cardinal}, \code{cardinal-open},
#'         \code{cardinal-closed}, \code{monotone}. For more information about each
#'         interpolation method, please see D3’s line interpolation.
#' @param tension Depending on the interpolation type, sets the tension parameter.
#'        (See D3’s line interpolation.)
#' @param color  color of the mark – either fill or stroke color based on the filled mark config.
#' @param fill fill color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is true.
#' @param stroke stroke color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is false.
#' @param opacity \code{0.0}-\code{1.0}
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
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
mark_line <- function(vl, orient=NULL, interpolate=NULL, tension=NULL, opacity=NULL,
                      color=NULL, fill=NULL, stroke=NULL) {
  vl$x$mark <- "line"
  if (!is.null(interpolate)) vl$x$config$mark$interpolate <- interpolate
  if (!is.null(tension)) vl$x$config$mark$tension <- tension
  if (!is.null(orient)) vl$x$config$mark$orient <- orient
  if (!is.null(opacity)) vl$x$config$mark$opacity <- opacity
  if (!is.null(color)) vl$x$config$mark$color <- color
  if (!is.null(fill)) vl$x$config$mark$fill <- fill
  if (!is.null(stroke)) vl$x$config$mark$stroke <- stroke
  return(vl)
}

#' Area mark
#'
#' An area represent multiple data element as a single area shape.
#'
#' @param vl Vega-Lite object
#' @param orient the orientation of a non-stacked bar, area, and line charts.
#'        The value is either "horizontal", or "vertical" (default). For bar and
#'        tick, this determines whether the size of the bar and tick should be
#'        applied to x or y dimension. For area, this property determines the
#'        orient property of the Vega output. For line, this property determines
#'        the path order of the points in the line if path channel is not specified.
#'        For stacked charts, this is always determined by the orientation of the stack;
#'        therefore explicitly specified value will be ignored.
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
#' @param filled whether the shape's color should be used as fill color instead of stroke color.
#' @param color  color of the mark – either fill or stroke color based on the filled mark config.
#' @param fill fill color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is true.
#' @param stroke stroke color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is false.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
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
mark_area <- function(vl, orient=NULL, stack=NULL, interpolate=NULL, tension=NULL,
                      opacity=NULL, filled=NULL, color=NULL, fill=NULL, stroke=NULL) {
  vl$x$mark <- "area"
  if (!is.null(stack)) vl$x$config$mark$stacked <- stack
  if (!is.null(interpolate)) vl$x$config$mark$interpolate <- interpolate
  if (!is.null(tension)) vl$x$config$mark$tension <- tension
  if (!is.null(orient)) vl$x$config$mark$orient <- orient
  if (!is.null(opacity)) vl$x$config$mark$opacity <- opacity
  if (!is.null(filled)) vl$x$config$mark$filled <- filled
  if (!is.null(color)) vl$x$config$mark$color <- color
  if (!is.null(fill)) vl$x$config$mark$fill <- fill
  if (!is.null(stroke)) vl$x$config$mark$stroke <- stroke
  return(vl)
}

#' Point mark
#'
#' A point mark represents each data point with a symbol.
#'
#' @param vl Vega-Lite object
#' @param shape The symbol shape to use. One of \code{circle}, \code{square},
#'        \code{cross}, \code{diamond}, \code{triangle-up}, or \code{triangle-down}.
#'        Default value: \code{circle}.
#' @param size The pixel area each the point. For example: in the case of circles,
#'        the radius is determined in part by the square root of the size value.
#' @param opacity \code{0.0}-\code{1.0}
#' @param filled whether the shape's color should be used as fill color instead of stroke color.
#' @param color  color of the mark – either fill or stroke color based on the filled mark config.
#' @param fill fill color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is true.
#' @param stroke stroke color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is false.
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @encoding UTF-8
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   mark_point()
mark_point <- function(vl, shape="circle", size=NULL, opacity=NULL, filled=NULL,
                       color=NULL, fill=NULL, stroke=NULL) {
  vl$x$mark <- "point"
  vl$x$config$mark$shape <- shape
  vl$x$config$mark$size <- size
  if (!is.null(opacity)) vl$x$config$mark$opacity <- opacity
  if (!is.null(filled)) vl$x$config$mark$filled <- filled
  if (!is.null(color)) vl$x$config$mark$color <- color
  if (!is.null(fill)) vl$x$config$mark$fill <- fill
  if (!is.null(stroke)) vl$x$config$mark$stroke <- stroke
  return(vl)
}

#' Text mark
#'
#' A text mark represents each data point with a text instead of a point.
#'
#' @param vl a Vega-Lite object
#' @param opacity \code{0.0}-\code{1.0}
#' @param color  color of the mark – either fill or stroke color based on the filled mark config.
#' @param fill fill color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is true.
#' @param stroke stroke color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is false.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
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
mark_text <- function(vl, opacity=NULL, color=NULL, fill=NULL, stroke=NULL) {
  vl$x$mark <- "text"
  if (!is.null(opacity)) vl$x$config$mark$opacity <- opacity
  if (!is.null(color)) vl$x$config$mark$color <- color
  if (!is.null(fill)) vl$x$config$mark$fill <- fill
  if (!is.null(stroke)) vl$x$config$mark$stroke <- stroke
  return(vl)
}
