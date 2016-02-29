#' Quantitative Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @param clamp if true, values that exceed the data domain are clamped to either
#'        the minimum or maximum range value. Default value: derived from scale
#'        config (true by default) Supported Types: only linear, pow, sqrt, and log
#' @param nice If true, modifies the scale domain to use a more human-friendly
#'        number range (e.g., 7 instead of 6.96). Default value: true only for
#'        quantitative x and y scales and false otherwise.
#' @param zero If true, ensures that a zero baseline value is included in the
#'        scale domain. Default value: true if the quantitative field is not binned.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_x_linear <- function(vl, domain=NULL, range=NULL, clamp=NULL, nice=NULL, zero=NULL) {
  # vl$x$encoding$x$scale <- list(type="linear")
  if (!is.null(domain)) vl$x$encoding$x$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$x$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$x$scale$clamp <- clamp
  if (!is.null(nice)) vl$x$encoding$x$scale$nice <- nice
  if (!is.null(zero)) vl$x$encoding$x$scale$zero <- zero
  vl
}

#' Quantitative Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @param clamp if true, values that exceed the data domain are clamped to either
#'        the minimum or maximum range value. Default value: derived from scale
#'        config (true by default) Supported Types: only linear, pow, sqrt, and log
#' @param exp exponent
#' @param nice If true, modifies the scale domain to use a more human-friendly
#'        number range (e.g., 7 instead of 6.96). Default value: true only for
#'        quantitative x and y scales and false otherwise.
#' @param zero If true, ensures that a zero baseline value is included in the
#'        scale domain. Default value: true if the quantitative field is not binned.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_x_pow <- function(vl, domain=NULL, range=NULL, clamp=NULL, exp=NULL,
                        nice=NULL, zero=NULL) {
  vl$x$encoding$x$scale <- list(type="pow")
  if (!is.null(domain)) vl$x$encoding$x$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$x$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$x$scale$clamp <- clamp
  if (!is.null(clamp)) vl$x$encoding$x$scale$exp <- exp
  if (!is.null(nice)) vl$x$encoding$x$scale$nice <- nice
  if (!is.null(zero)) vl$x$encoding$x$scale$zero <- zero
  vl
}

#' Sqrt Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @param clamp if true, values that exceed the data domain are clamped to either
#'        the minimum or maximum range value. Default value: derived from scale
#'        config (true by default) Supported Types: only linear, pow, sqrt, and log
#' @param nice If true, modifies the scale domain to use a more human-friendly
#'        number range (e.g., 7 instead of 6.96). Default value: true only for
#'        quantitative x and y scales and false otherwise.
#' @param zero If true, ensures that a zero baseline value is included in the
#'        scale domain. Default value: true if the quantitative field is not binned.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_x_sqrt <- function(vl, domain=NULL, range=NULL, clamp=NULL, nice=NULL, zero=NULL) {
  vl$x$encoding$x$scale <- list(type="sqrt")
  if (!is.null(domain)) vl$x$encoding$x$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$x$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$x$scale$clamp <- clamp
  if (!is.null(nice)) vl$x$encoding$x$scale$nice <- nice
  if (!is.null(zero)) vl$x$encoding$x$scale$zero <- zero
  vl
}

#' Log Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @param clamp if true, values that exceed the data domain are clamped to either
#'        the minimum or maximum range value. Default value: derived from scale
#'        config (true by default) Supported Types: only linear, pow, sqrt, and log
#' @param nice If true, modifies the scale domain to use a more human-friendly
#'        number range (e.g., 7 instead of 6.96). Default value: true only for
#'        quantitative x and y scales and false otherwise.
#' @param zero If true, ensures that a zero baseline value is included in the
#'        scale domain. Default value: true if the quantitative field is not binned.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_x_log <- function(vl, domain=NULL, range=NULL, clamp=NULL, nice=NULL, zero=NULL) {
  vl$x$encoding$x$scale <- list(type="log")
  if (!is.null(domain)) vl$x$encoding$x$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$x$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$x$scale$clamp <- clamp
  if (!is.null(nice)) vl$x$encoding$x$scale$nice <- nice
  if (!is.null(zero)) vl$x$encoding$x$scale$zero <- zero
  vl
}

#' Quantize Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @param clamp if true, values that exceed the data domain are clamped to either
#'        the minimum or maximum range value. Default value: derived from scale
#'        config (true by default) Supported Types: only linear, pow, sqrt, and log
#' @param nice If true, modifies the scale domain to use a more human-friendly
#'        number range (e.g., 7 instead of 6.96). Default value: true only for
#'        quantitative x and y scales and false otherwise.
#' @param zero If true, ensures that a zero baseline value is included in the
#'        scale domain. Default value: true if the quantitative field is not binned.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_x_quantize <- function(vl, domain=NULL, range=NULL, clamp=NULL, nice=NULL, zero=NULL) {
  vl$x$encoding$x$scale <- list(type="quantize")
  if (!is.null(domain)) vl$x$encoding$x$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$x$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$x$scale$clamp <- clamp
  if (!is.null(nice)) vl$x$encoding$x$scale$nice <- nice
  if (!is.null(zero)) vl$x$encoding$x$scale$zero <- zero
  vl
}

#' Quantile Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @param clamp if true, values that exceed the data domain are clamped to either
#'        the minimum or maximum range value. Default value: derived from scale
#'        config (true by default) Supported Types: only linear, pow, sqrt, and log
#' @param nice If true, modifies the scale domain to use a more human-friendly
#'        number range (e.g., 7 instead of 6.96). Default value: true only for
#'        quantitative x and y scales and false otherwise.
#' @param zero If true, ensures that a zero baseline value is included in the
#'        scale domain. Default value: true if the quantitative field is not binned.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_x_quantile <- function(vl, domain=NULL, range=NULL, clamp=NULL, nice=NULL, zero=NULL) {
  vl$x$encoding$x$scale <- list(type="quantile")
  if (!is.null(domain)) vl$x$encoding$x$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$x$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$x$scale$clamp <- clamp
  if (!is.null(nice)) vl$x$encoding$x$scale$nice <- nice
  if (!is.null(zero)) vl$x$encoding$x$scale$zero <- zero
  vl
}

#' Ordinal Scale
#'
#' @param vl Vega-Lite object
#' @param band_size band size
#' @param padding padding
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
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
scale_x_ordinal <- function(vl, band_size=NULL, padding=NULL) {
  if (!is.null(band_size)) vl$x$encoding$x$scale$bandSize <- band_size
  if (!is.null(padding)) vl$x$encoding$x$scale$padding <- padding
  vl
}

#' Threshold Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @param clamp if true, values that exceed the data domain are clamped to either
#'        the minimum or maximum range value. Default value: derived from scale
#'        config (true by default) Supported Types: only linear, pow, sqrt, and log
#' @param nice If true, modifies the scale domain to use a more human-friendly
#'        number range (e.g., 7 instead of 6.96). Default value: true only for
#'        quantitative x and y scales and false otherwise.
#' @param zero If true, ensures that a zero baseline value is included in the
#'        scale domain. Default value: true if the quantitative field is not binned.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_x_threshold <- function(vl, domain=NULL, range=NULL, clamp=NULL, nice=NULL, zero=NULL) {
  vl$x$encoding$x$scale <- list(type="threshold")
  if (!is.null(domain)) vl$x$encoding$x$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$x$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$x$scale$clamp <- clamp
  if (!is.null(nice)) vl$x$encoding$x$scale$nice <- nice
  if (!is.null(zero)) vl$x$encoding$x$scale$zero <- zero
  vl
}

#' Temporal Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @param clamp if true, values that exceed the data domain are clamped to either
#'        the minimum or maximum range value. Default value: derived from scale
#'        config (true by default) Supported Types: only linear, pow, sqrt, and log
#' @param nice If true, modifies the scale domain to use a more human-friendly
#'        number range (e.g., 7 instead of 6.96). Default value: true only for
#'        quantitative x and y scales and false otherwise.
#' @param zero If true, ensures that a zero baseline value is included in the
#'        scale domain. Default value: true if the quantitative field is not binned.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_x_time <- function(vl, domain=NULL, range=NULL, clamp=NULL, nice=NULL, zero=NULL) {
  # vl$x$encoding$x$scale <- list(type="temporal")
  if (!is.null(domain)) vl$x$encoding$x$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$x$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$x$scale$clamp <- clamp
  if (!is.null(nice)) vl$x$encoding$x$scale$nice <- nice
  if (!is.null(zero)) vl$x$encoding$x$scale$zero <- zero
  vl
}

#' Linear Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @param clamp if true, values that exceed the data domain are clamped to either
#'        the minimum or maximum range value. Default value: derived from scale
#'        config (true by default) Supported Types: only linear, pow, sqrt, and log
#' @param nice If true, modifies the scale domain to use a more human-friendly
#'        number range (e.g., 7 instead of 6.96). Default value: true only for
#'        quantitative x and y scales and false otherwise.
#' @param zero If true, ensures that a zero baseline value is included in the
#'        scale domain. Default value: true if the quantitative field is not binned.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_linear <- function(vl,  domain=NULL, range=NULL, clamp=NULL, nice=NULL, zero=NULL) {
  # vl$x$encoding$y$scale <- list(type="linear")
  if (!is.null(domain)) vl$x$encoding$y$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$y$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$y$scale$clamp <- clamp
  if (!is.null(nice)) vl$x$encoding$y$scale$nice <- nice
  if (!is.null(zero)) vl$x$encoding$y$scale$zero <- zero
  vl
}

#' Power Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @param clamp if true, values that exceed the data domain are clamped to either
#'        the minimum or maximum range value. Default value: derived from scale
#'        config (true by default) Supported Types: only linear, pow, sqrt, and log
#' @param exp exponent
#' @param nice If true, modifies the scale domain to use a more human-friendly
#'        number range (e.g., 7 instead of 6.96). Default value: true only for
#'        quantitative x and y scales and false otherwise.
#' @param zero If true, ensures that a zero baseline value is included in the
#'        scale domain. Default value: true if the quantitative field is not binned.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_pow <- function(vl, domain=NULL, range=NULL, clamp=NULL, exp=NULL,
                        nice=NULL, zero=NULL) {
  vl$x$encoding$y$scale <- list(type="pow")
  if (!is.null(domain)) vl$x$encoding$y$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$y$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$y$scale$clamp <- clamp
  if (!is.null(exp)) vl$x$encoding$y$scale$exp <- exp
  if (!is.null(nice)) vl$x$encoding$y$scale$nice <- nice
  if (!is.null(zero)) vl$x$encoding$y$scale$zero <- zero
  vl
}

#' Sqrt Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @param clamp if true, values that exceed the data domain are clamped to either
#'        the minimum or maximum range value. Default value: derived from scale
#'        config (true by default) Supported Types: only linear, pow, sqrt, and log
#' @param nice If true, modifies the scale domain to use a more human-friendly
#'        number range (e.g., 7 instead of 6.96). Default value: true only for
#'        quantitative x and y scales and false otherwise.
#' @param zero If true, ensures that a zero baseline value is included in the
#'        scale domain. Default value: true if the quantitative field is not binned.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_sqrt <- function(vl,  domain=NULL, range=NULL, clamp=NULL, nice=NULL, zero=NULL) {
  vl$x$encoding$y$scale <- list(type="sqrt")
  if (!is.null(domain)) vl$x$encoding$y$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$y$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$y$scale$clamp <- clamp
  if (!is.null(nice)) vl$x$encoding$y$scale$nice <- nice
  if (!is.null(zero)) vl$x$encoding$y$scale$zero <- zero
  vl
}

#' Log Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @param clamp if true, values that exceed the data domain are clamped to either
#'        the minimum or maximum range value. Default value: derived from scale
#'        config (true by default) Supported Types: only linear, pow, sqrt, and log
#' @param nice If true, modifies the scale domain to use a more human-friendly
#'        number range (e.g., 7 instead of 6.96). Default value: true only for
#'        quantitative x and y scales and false otherwise.
#' @param zero If true, ensures that a zero baseline value is included in the
#'        scale domain. Default value: true if the quantitative field is not binned.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_log <- function(vl,  domain=NULL, range=NULL, clamp=NULL, nice=NULL, zero=NULL) {
  vl$x$encoding$y$scale <- list(type="log")
  if (!is.null(domain)) vl$x$encoding$y$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$y$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$y$scale$clamp <- clamp
  if (!is.null(nice)) vl$x$encoding$y$scale$nice <- nice
  if (!is.null(zero)) vl$x$encoding$y$scale$zero <- zero
  vl
}

#' Quantize Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @param clamp if true, values that exceed the data domain are clamped to either
#'        the minimum or maximum range value. Default value: derived from scale
#'        config (true by default) Supported Types: only linear, pow, sqrt, and log
#' @param nice If true, modifies the scale domain to use a more human-friendly
#'        number range (e.g., 7 instead of 6.96). Default value: true only for
#'        quantitative x and y scales and false otherwise.
#' @param zero If true, ensures that a zero baseline value is included in the
#'        scale domain. Default value: true if the quantitative field is not binned.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_quantize <- function(vl,  domain=NULL, range=NULL, clamp=NULL, nice=NULL, zero=NULL) {
  vl$x$encoding$y$scale <- list(type="quantize")
  if (!is.null(domain)) vl$x$encoding$y$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$y$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$y$scale$clamp <- clamp
  if (!is.null(nice)) vl$x$encoding$y$scale$nice <- nice
  if (!is.null(zero)) vl$x$encoding$y$scale$zero <- zero
  vl
}

#' Quantile Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @param clamp if true, values that exceed the data domain are clamped to either
#'        the minimum or maximum range value. Default value: derived from scale
#'        config (true by default) Supported Types: only linear, pow, sqrt, and log
#' @param nice If true, modifies the scale domain to use a more human-friendly
#'        number range (e.g., 7 instead of 6.96). Default value: true only for
#'        quantitative x and y scales and false otherwise.
#' @param zero If true, ensures that a zero baseline value is included in the
#'        scale domain. Default value: true if the quantitative field is not binned.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_quantile <- function(vl,  domain=NULL, range=NULL, clamp=NULL, nice=NULL, zero=NULL) {
  vl$x$encoding$y$scale <- list(type="quantile")
  if (!is.null(domain)) vl$x$encoding$y$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$y$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$y$scale$clamp <- clamp
  if (!is.null(nice)) vl$x$encoding$y$scale$nice <- nice
  if (!is.null(zero)) vl$x$encoding$y$scale$zero <- zero
  vl
}

#' Ordinal Scale
#'
#' @param vl Vega-Lite object
#' @param band_size band size
#' @param padding padding
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_ordinal <- function(vl, band_size=NULL, padding=NULL) {
  # vl$x$encoding$y$scale <- list(type="ordinal")
  if (!is.null(band_size)) vl$x$encoding$y$scale$bandSize <- band_size
  if (!is.null(padding)) vl$x$encoding$y$scale$padding <- padding
  vl
}

#' Threshold Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @param clamp if true, values that exceed the data domain are clamped to either
#'        the minimum or maximum range value. Default value: derived from scale
#'        config (true by default) Supported Types: only linear, pow, sqrt, and log
#' @param nice If true, modifies the scale domain to use a more human-friendly
#'        number range (e.g., 7 instead of 6.96). Default value: true only for
#'        quantitative x and y scales and false otherwise.
#' @param zero If true, ensures that a zero baseline value is included in the
#'        scale domain. Default value: true if the quantitative field is not binned.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_threshold <- function(vl, domain=NULL, range=NULL, clamp=NULL, nice=NULL, zero=NULL) {
  vl$x$encoding$y$scale <- list(type="threshold")
  if (!is.null(domain)) vl$x$encoding$y$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$y$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$y$scale$clamp <- clamp
  if (!is.null(nice)) vl$x$encoding$y$scale$nice <- nice
  if (!is.null(zero)) vl$x$encoding$y$scale$zero <- zero
  vl
}

#' Temporal Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @param clamp if true, values that exceed the data domain are clamped to either
#'        the minimum or maximum range value. Default value: derived from scale
#'        config (true by default) Supported Types: only linear, pow, sqrt, and log
#' @param nice If true, modifies the scale domain to use a more human-friendly
#'        number range (e.g., 7 instead of 6.96). Default value: true only for
#'        quantitative x and y scales and false otherwise.
#' @param zero If true, ensures that a zero baseline value is included in the
#'        scale domain. Default value: true if the quantitative field is not binned.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_y_time <- function(vl, domain=NULL, range=NULL, clamp=NULL, nice=NULL, zero=NULL) {
  # vl$x$encoding$y$scale <- list(type="time")
  if (!is.null(domain)) vl$x$encoding$y$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$y$scale$range <- range
  if (!is.null(clamp)) vl$x$encoding$y$scale$clamp <- clamp
  if (!is.null(nice)) vl$x$encoding$y$scale$nice <- nice
  if (!is.null(zero)) vl$x$encoding$y$scale$zero <- zero
  vl
}

#' Nominal Color Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_color_nominal <- function(vl, domain=NULL, range=NULL) {
  if (!is.null(domain)) vl$x$encoding$color$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$color$scale$range <- range
  vl
}

#' Sequential Color Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_color_sequential <- function(vl, domain=NULL, range=NULL) {
  if (!is.null(domain)) vl$x$encoding$color$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$color$scale$range <- range
  vl
}

#' Shape Scale
#'
#' @param vl Vega-Lite object
#' @param domain Custom domain values. For quantitative data, this can take the
#'        form of a two-element array with minimum and maximum values.
#' @param range The range of the scale represents the set of output visual values.
#'        Vega-Lite automatically determines appropriate range based on the scale’s
#'        channel and type, but range property can be provided to customize range
#'        values.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/scale.html}{Vega-Lite Scales spec}
#' @export
scale_shape <- function(vl, domain=NULL, range=NULL) {
  if (!is.null(domain)) vl$x$encoding$color$scale$domain <- domain
  if (!is.null(range)) vl$x$encoding$color$scale$range <- range
  vl
}

