#' Vega-Lite Scales
#'
#' @param vl Vega-Lite object
#' @param chnl x,y,color,shape
#' @param type linear, log, pow, sqrt, quantize, quantile, threshold, time, ordinal
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @param round If true, rounds numeric output values to integers.
#' @param clamp if true, values that exceed the data domain are clamped to either
#'        the minimum or maximum range value. Default value: derived from scale
#'        config (true by default) Supported Types: only linear, pow, sqrt, and log
#' @param exponent in the "pow" scale only, expresses each range value y as a power
#'        (exponential) function of the domain value x: y = mx^k + b where k is
#'         \code{exponent}
#' @param nice If true, modifies the scale domain to use a more human-friendly
#'        number range (e.g., 7 instead of 6.96). Default value: true only for
#'        quantitative x and y scales and false otherwise.
#' @param zero If true, ensures that a zero baseline value is included in the
#'        scale domain. Default value: true if the quantitative field is not binned.
#' @param useRawDomain If true, set scale domain to the raw data domain. If
#'        false, use the aggregated data domain for scale.
#' @param band_size Width for each x or y ordinal band. This can be an integer
#'        value or a string "fit". For "fit", the band size will be
#'        automatically adjusted to fit the scale for the specified width
#'        (for x-axis) or height (for y-axis).
#' @param padding For x and y channels, the padding is a multiple of the spacing
#'        between points. A reasonable value is 1.0, such that the first and
#'        last point will be offset from the minimum and maximum value by half
#'        the distance between points. (See D3’s
#'        \href{https://github.com/mbostock/d3/wiki/Ordinal-Scales#ordinal_rangePoints}{ordinalRangePoints()}
#'        for illustration.)
#' @encoding UTF-8
#' @name scale_vl
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_vl <- function(vl, chnl="x", type="linear", domain=NULL, range=NULL,
                     round=NULL, clamp=NULL, exponent=NULL, nice=NULL,
                     zero=NULL, useRawDomain=NULL, band_size=NULL, padding=NULL) {

  vl$x$encoding[[chnl]]$scale$type <- type

  if(type == "pow" & !is.null(exponent)) vl$x$encoding[[chnl]]$scale$exponent <- exponent

  if (type == "ordinal") {
    if (!is.null(band_size))      vl$x$encoding[[chnl]]$scale$bandSize <- band_size
    if (!is.null(padding))       vl$x$encoding[[chnl]]$scale$padding <- padding
  }

  if (!is.null(domain))        vl$x$encoding[[chnl]]$scale$domain <- domain
  if (!is.null(range))         vl$x$encoding[[chnl]]$scale$range <- range
  if (!is.null(clamp))         vl$x$encoding[[chnl]]$scale$clamp <- clamp

  if (!is.null(nice))          vl$x$encoding[[chnl]]$scale$nice <- nice
  if (!is.null(zero))          vl$x$encoding[[chnl]]$scale$zero <- zero
  if (!is.null(useRawDomain))  vl$x$encoding[[chnl]]$scale$useRawDomain <- useRawDomain

  vl
}


#' @rdname scale_vl
#' @export
scale_x_linear_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="x", type="linear", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_y_linear_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="y", type="linear", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_x_pow_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="x", type="pow", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_y_pow_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="y", type="pow", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_x_sqrt_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="x", type="sqrt", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_y_sqrt_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="y", type="sqrt", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_x_log_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="x", type="log", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_y_log_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="y", type="log", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_x_quantize_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="x", type="quantize", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_y_quantize_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="y", type="quantize", ...)
  vl
}


#' @rdname scale_vl
#' @export
scale_x_quantile_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="x", type="quantile", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_y_quantile_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="y", type="quantile", ...)
  vl
}

#' @rdname scale_vl
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/population.json") %>%
#'   add_filter("datum.year == 2000") %>%
#'   calculate("gender", 'datum.sex == 2 ? "Female" : "Male"') %>%
#'   encode_x("gender", "nominal") %>%
#'   encode_y("people", "quantitative", aggregate="sum") %>%
#'   encode_color("gender", "nominal") %>%
#'   scale_x_ordinal(band_size=6) %>%
#'   scale_color_nominal(range=c("#EA98D2", "#659CCA")) %>%
#'   facet_col("age", "ordinal", padding=4) %>%
#'   axis_x(remove=TRUE) %>%
#'   axis_y(title="population", grid=FALSE) %>%
#'   axis_facet_col(orient="bottom", axisWidth=1, offset=-8) %>%
#'   facet_cell(stroke_width=0) %>%
#'   mark_bar()
scale_x_ordinal_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="x", type="ordinal", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_y_ordinal_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="y", type="ordinal", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_x_threshold_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="x", type="threshold", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_y_threshold_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="y", type="threshold", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_x_time_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="x", type="time", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_y_time_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="y", type="time", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_color_nominal_vl <- function(vl, ...) {
  vl <- scale_vl(vl, chnl="color", type="ordinal", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_color_sequential_vl <- function(vl, type="ordinal", range=NULL, ...) {
  if (length(range)!=2) {
    message('Vega-lite only supports sequential color interpolation between two values.')
    return(vl)
  }

  vl <- scale_vl(vl, chnl="color", type="ordinal", ...)
  vl
}

#' @rdname scale_vl
#' @export
scale_shape_vl <- function(vl, range=NULL, ...) {
  shapes <- c("circle", "cross", "diamond", "square", "triangle-down",
              "triangle-up")
  if (!all(range %in% shapes)) {
    message('Invalid shape range')
    return(vl)
  }

  vl <- scale_vl(vl, chnl="shape", type="ordinal", ...)
  vl
}

