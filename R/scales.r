#' Quantitative Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_x_linear <- function(vl, domain, range, clamp, nice, zero) {
  vl$x$encoding$x$scale <- list(type="linear")
  vl
}

#' Quantitative Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_x_pow <- function(vl, domain, range, clamp, exp, nice, zero) {
  vl$x$encoding$x$scale <- list(type="pow")
  vl
}

#' Sqrt Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_x_sqrt <- function(vl, domain, range, clamp, nice, zero) {
  vl$x$encoding$x$scale <- list(type="sqrt")
  vl
}

#' Log Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_x_log <- function(vl, domain, range, clamp, nice, zero) {
  vl$x$encoding$x$scale <- list(type="log")
  vl
}

#' Quantize Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_x_quantize <- function(vl, domain, rang, nice, zeroe) {
  vl$x$encoding$x$scale <- list(type="quantize")
  vl
}

#' Quantile Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_x_quantile <- function(vl, domain, range, nice, zero) {
  vl$x$encoding$x$scale <- list(type="quantile")
  vl
}

#' Ordinal Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_x_ordinal <- function(vl, band_size=NULL, padding=NULL) {
  if (!is.null(band_size)) vl$x$encoding$x$scale$bandSize <- band_size
  if (!is.null(padding)) vl$x$encoding$x$scale$padding <- padding
  vl
}

#' Threshold Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_x_threshold <- function(vl, domain, range, nice, zero) {
  vl$x$encoding$x$scale <- list(type="threshold")
  vl
}

#' Temporal Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_x_time <- function(vl, domain=NULL, range=NULL, clamp=NULL, nice=NULL) {
  if (!is.null(domain)) vl$x$encoding$x$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$x$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$x$scale$clamp <- clamp
  if (!is.null(nice)) vl$x$encoding$x$scale$nice <- nice
  vl
}

#' Linear Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_linear <- function(vl, domain, range, clamp, nice, zero) {
  vl$x$encoding$y$scale <- list(type="linear")
  vl
}

#' Power Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_pow <- function(vl, domain, range, clamp, exp, nice, zero) {
  vl$x$encoding$y$scale <- list(type="pow")
  vl
}

#' Sqrt Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_sqrt <- function(vl, domain, range, clamp, nice, zero) {
  vl$x$encoding$y$scale <- list(type="sqrt")
  vl
}

#' Log Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_log <- function(vl, domain, range, clamp, nice, zero) {
  vl$x$encoding$y$scale <- list(type="log")
  vl
}

#' Quantize Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_quantize <- function(vl, domain, range, nice, zero) {
  vl$x$encoding$y$scale <- list(type="quantize")
  vl
}

#' Quantile Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_quantile <- function(vl, domain, range, nice, zero) {
  vl$x$encoding$y$scale <- list(type="quantlze")
  vl
}

#' Ordinal Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_ordinal <- function(vl, band_size=NULL, padding=NULL) {
  vl$x$encoding$y$scale <- list(type="ordinal")
  if (!is.null(band_size)) vl$x$encoding$y$scale$bandSize <- band_size
  if (!is.null(padding)) vl$x$encoding$y$scale$padding <- padding
  vl
}

#' Threshold Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_threshold <- function(vl, domain, range, nice, zero) {
  vl$x$encoding$y$scale <- list(type="threshold")
  vl
}

#' Temporal Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_time <- function(vl, domain=NULL, range=NULL, clamp=NULL, nice=NULL) {
  vl$x$encoding$y$scale <- list(type="time")
  if (!is.null(domain)) vl$x$encoding$y$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$y$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$y$scale$clamp <- clamp
  if (!is.null(nice)) vl$x$encoding$y$scale$nice <- nice
  vl
}

#' Nominal Color Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_color_nominal <- function(vl, domain=NULL, range=NULL) {
  if (!is.null(domain)) vl$x$encoding$color$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$color$scale$range <- range
  vl
}

#' Sequential Color Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_color_sequential <- function(vl, domain, range) {
  vl
}

#' Shape Scale
#'
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_shape <- function(vl, range) {
  vl
}

