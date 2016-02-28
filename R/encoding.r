#' Encode x "channel"
#'
#' Vega-Lite has many "encoding channels". Each channel definition object must
#' describe the data field encoded by the channel and its data type, or a constant
#' value directly mapped to the mark properties. In addition, it can describe the
#' mapped field’s transformation and properties for its scale and guide.
#'
#' @param vl Vega-Lite object created by \code{\link{vegalite}}
#' @param field single element character vector naming the column. Can be \code{*} is using
#'        \code{aggregate}.
#' @param type the encoded field’s type of measurement. This can be either a full type
#'        name (\code{quantitative}, \code{temporal}, \code{ordinal}, and \code{nominal})
#'        or an initial character of the type name (\code{Q}, \code{T}, \code{O}, \code{N}).
#'        This property is case insensitive. If \code{auto} is used, the type will
#'        be guessed (so you may want to actually specify it if you want consistency).
#' @param aggregate perform aggregaton on \code{field}. See
#'        \href{http://vega.github.io/vega-lite/docs/aggregate.html}{Supported Aggregation Options} for
#'        more info on valid operations. Leave \code{NULL} for no aggregation.
#' @param sort either one of \code{ascending}, \code{descending} or (for ordinal scales)
#'        the result of a call to \code{\link{sort_def}}
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
#' @export
encode_x <- function(vl, field, type="auto", aggregate=NULL, sort=NULL) {

  type <- tolower(type)
  if (type == "auto") type <- "quantitative"
  if (!type %in% c("quantitative", "temporal", "ordinal", "nominal", "q", "t", "o", "n")) {
    message('"type" is not a valid value for this spec component. Ignoring.')
    return(vl)
  }

  vl$x$encoding$x <- list(field=field, type=type)

  if (!is.null(aggregate)) vl$x$encoding$x$aggregate <- aggregate
  if (!is.null(sort)) vl$x$encoding$x$sort <- sort

  vl

}

#' Encode y "channel"
#'
#' Vega-Lite has many "encoding channels". Each channel definition object must
#' describe the data field encoded by the channel and its data type, or a constant
#' value directly mapped to the mark properties. In addition, it can describe the
#' mapped field’s transformation and properties for its scale and guide.
#'
#' @param vl Vega-Lite object created by \code{\link{vegalite}}
#' @param field single element character vector naming the column
#' @param type the encoded field’s type of measurement. This can be either a full type
#'        name (\code{quantitative}, \code{temporal}, \code{ordinal}, and \code{nominal})
#'        or an initial character of the type name (\code{Q}, \code{T}, \code{O}, \code{N}).
#'        This property is case insensitive. If \code{auto} is used, the type will
#'        be guessed (so you may want to actually specify it if you want consistency).
#' @param aggregate perform aggregaton on \code{field}. See
#'        \href{http://vega.github.io/vega-lite/docs/aggregate.html}{Supported Aggregation Options} for
#'        more info on valid operations. Leave \code{NULL} for no aggregation.
#' @param sort either one of \code{ascending}, \code{descending} or (for ordinal scales)
#'        the result of a call to \code{\link{sort_def}}
#' @encoding UTF-8
#' @export
encode_y <- function(vl, field, type="auto", aggregate=NULL, sort=NULL) {

  type <- tolower(type)
  if (type == "auto") type <- "quantitative"
  if (!type %in% c("quantitative", "temporal", "ordinal", "nominal", "q", "t", "o", "n")) {
    message('"type" is not a valid value for this spec component. Ignoring.')
    return(vl)
  }

  vl$x$encoding$y <- list(field=field, type=type)

  if (!is.null(aggregate)) vl$x$encoding$y$aggregate <- aggregate
  if (!is.null(sort)) vl$x$encoding$y$sort <- sort

  vl

}

#' Encode color "channel"
#'
#' @param vl Vega-Lite object created by \code{\link{vegalite}}
#' @param field single element character vector naming the column
#' @param type the encoded field’s type of measurement. This can be either a full type
#'        name (\code{quantitative}, \code{temporal}, \code{ordinal}, and \code{nominal})
#'        or an initial character of the type name (\code{Q}, \code{T}, \code{O}, \code{N}).
#'        This property is case insensitive. If \code{auto} is used, the type will
#'        be guessed (so you may want to actually specify it if you want consistency).
#' @param aggregate perform aggregaton on \code{field}. See
#'        \href{http://vega.github.io/vega-lite/docs/aggregate.html}{Supported Aggregation Options} for
#'        more info on valid operations. Leave \code{NULL} for no aggregation.
#' @param sort either one of \code{ascending}, \code{descending} or (for ordinal scales)
#'        the result of a call to \code{\link{sort_def}}
#' @param value scale value
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
#' @encoding UTF-8
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   encode_color("Origin", "nominal") %>%
#'   encode_shape("Origin", "nominal") %>%
#'   mark_point()
encode_color <- function(vl, field=NULL, type, value=NULL, aggregate=NULL, sort=NULL) {

  if (is.null(field) & is.null(value)) {
    stop('Either "field" or "value" must be specified', call.=FALSE)
  }

  if (!is.null(field)) {
    type <- tolower(type)
    if (type == "auto") type <- "quantitative"
    if (!type %in% c("quantitative", "temporal", "ordinal", "nominal", "q", "t", "o", "n")) {
      message('"type" is not a valid value for this spec component. Ignoring.')
      return(vl)
    }
    vl$x$encoding$color <- list(field=field, type=type)
  } else {
    vl$x$encoding$color <- list(value=value)
  }

  if (!is.null(aggregate)) vl$x$encoding$color$aggregate <- aggregate
  if (!is.null(sort)) vl$x$encoding$color$sort <- sort

  vl

}

#' Encode shape "channel"
#'
#' @param vl Vega-Lite object created by \code{\link{vegalite}}
#' @param field single element character vector naming the column
#' @param type the encoded field’s type of measurement. This can be either a full type
#'        name (\code{quantitative}, \code{temporal}, \code{ordinal}, and \code{nominal})
#'        or an initial character of the type name (\code{Q}, \code{T}, \code{O}, \code{N}).
#'        This property is case insensitive. If \code{auto} is used, the type will
#'        be guessed (so you may want to actually specify it if you want consistency).
#' @param aggregate perform aggregaton on \code{field}. See
#'        \href{http://vega.github.io/vega-lite/docs/aggregate.html}{Supported Aggregation Options} for
#'        more info on valid operations. Leave \code{NULL} for no aggregation.
#' @param value scale value
#' @param sort either one of \code{ascending}, \code{descending} or (for ordinal scales)
#'        the result of a call to \code{\link{sort_def}}
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
#' @encoding UTF-8
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   encode_color("Origin", "nominal") %>%
#'   encode_shape("Origin", "nominal") %>%
#'   mark_point()
encode_shape <- function(vl, field=NULL, type, value=NULL, aggregate=NULL, sort=NULL) {

  if (is.null(field) & is.null(value)) {
    stop('Either "field" or "value" must be specified', call.=FALSE)
  }

  if (!is.null(field)) {
    type <- tolower(type)
    if (type == "auto") type <- "quantitative"
    if (!type %in% c("quantitative", "temporal", "ordinal", "nominal", "q", "t", "o", "n")) {
      message('"type" is not a valid value for this spec component. Ignoring.')
      return(vl)
    }
    vl$x$encoding$shape <- list(field=field, type=type)
  } else {
    vl$x$encoding$shape <- list(value=value)
  }

  if (!is.null(aggregate)) vl$x$encoding$shape$aggregate <- aggregate
  if (!is.null(sort)) vl$x$encoding$shape$sort <- sort

  vl

}

#' Encode size "channel"
#'
#' @param vl Vega-Lite object created by \code{\link{vegalite}}
#' @param field single element character vector naming the column. Can be \code{*} is using
#'        \code{aggregate}.
#' @param value scale value
#' @param type the encoded field’s type of measurement. This can be either a full type
#'        name (\code{quantitative}, \code{temporal}, \code{ordinal}, and \code{nominal})
#'        or an initial character of the type name (\code{Q}, \code{T}, \code{O}, \code{N}).
#'        This property is case insensitive. If \code{auto} is used, the type will
#'        be guessed (so you may want to actually specify it if you want consistency).
#' @param aggregate perform aggregaton on \code{field}. See
#'        \href{http://vega.github.io/vega-lite/docs/aggregate.html}{Supported Aggregation Options} for
#'        more info on valid operations. Leave \code{NULL} for no aggregation.
#' @param sort either one of \code{ascending}, \code{descending} or (for ordinal scales)
#'        the result of a call to \code{\link{sort_def}}
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
#' @encoding UTF-8
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   encode_size("Acceleration", "quantitative") %>%
#'   mark_point()
encode_size <- function(vl, field=NULL, type, value=NULL, aggregate=NULL, sort=NULL) {

  if (is.null(field) & is.null(value)) {
    stop('Either "field" or "value" must be specified', call.=FALSE)
  }

  if (!is.null(field)) {
    type <- tolower(type)
    if (type == "auto") type <- "quantitative"
    if (!type %in% c("quantitative", "temporal", "ordinal", "nominal", "q", "t", "o", "n")) {
      message('"type" is not a valid value for this spec component. Ignoring.')
      return(vl)
    }
    vl$x$encoding$size <- list(field=field, type=type)
  } else {
    vl$x$encoding$size <- list(value=value)
  }

  if (!is.null(aggregate)) vl$x$encoding$size$aggregate <- aggregate
  if (!is.null(sort)) vl$x$encoding$size$sort <- sort

  vl

}

#' Encode text "channel"
#'
#' @param vl Vega-Lite object created by \code{\link{vegalite}}
#' @param field single element character vector naming the column. Can be \code{*} is using
#'        \code{aggregate}.
#' @param type the encoded field’s type of measurement. This can be either a full type
#'        name (\code{quantitative}, \code{temporal}, \code{ordinal}, and \code{nominal})
#'        or an initial character of the type name (\code{Q}, \code{T}, \code{O}, \code{N}).
#'        This property is case insensitive. If \code{auto} is used, the type will
#'        be guessed (so you may want to actually specify it if you want consistency).
#' @param value scale value
#' @param aggregate perform aggregaton on \code{field}. See
#'        \href{http://vega.github.io/vega-lite/docs/aggregate.html}{Supported Aggregation Options} for
#'        more info on valid operations. Leave \code{NULL} for no aggregation.
#' @param sort either one of \code{ascending}, \code{descending} or (for ordinal scales)
#'        the result of a call to \code{\link{sort_def}}
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
#' @export
encode_text <- function(vl, field, type, value=NULL, aggregate=NULL, sort=NULL) {

  if (is.null(field) & is.null(value)) {
    stop('Either "field" or "value" must be specified', call.=FALSE)
  }

  if (!is.null(field)) {
    type <- tolower(type)
    if (type == "auto") type <- "quantitative"
    if (!type %in% c("quantitative", "temporal", "ordinal", "nominal", "q", "t", "o", "n")) {
      message('"type" is not a valid value for this spec component. Ignoring.')
      return(vl)
    }
    vl$x$encoding$text <- list(field=field, type=type)
  } else {
    vl$x$encoding$text <- list(value=value)
  }

  if (!is.null(aggregate)) vl$x$encoding$text$aggregate <- aggregate
  if (!is.null(sort)) vl$x$encoding$text$sort <- sort

  vl

}

#' Encode detail "channel"
#'
#' Grouping data is another important operation in visualizing data. For
#' aggregated plots, all encoded fields without aggregate functions are used as
#' grouping fields in the aggregation (similar to fields in GROUP BY in SQL).
#' For line and area marks, mapping a data field to color or shape channel will
#' group the lines and stacked areas by the field.\cr
#' \cr
#' detail channel allows providing an additional grouping field (level) for
#' grouping data in aggregation without mapping data to a specific visual
#' channel.
#'
#' @param vl Vega-Lite object created by \code{\link{vegalite}}
#' @param field single element character vector naming the column
#' @param type the encoded field’s type of measurement. This can be either a full type
#'        name (\code{quantitative}, \code{temporal}, \code{ordinal}, and \code{nominal})
#'        or an initial character of the type name (\code{Q}, \code{T}, \code{O}, \code{N}).
#'        This property is case insensitive. If \code{auto} is used, the type will
#'        be guessed (so you may want to actually specify it if you want consistency).
#' @param aggregate perform aggregaton on \code{field}. See
#'        \href{http://vega.github.io/vega-lite/docs/aggregate.html}{Supported Aggregation Options} for
#'        more info on valid operations. Leave \code{NULL} for no aggregation.
#' @param sort either one of \code{ascending}, \code{descending} or (for ordinal scales)
#'        the result of a call to \code{\link{sort_def}}
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
#' @export
encode_detail <- function(vl, field=NULL, type, aggregate=NULL, sort=NULL) {

  type <- tolower(type)
  if (type == "auto") type <- "quantitative"
  if (!type %in% c("quantitative", "temporal", "ordinal", "nominal", "q", "t", "o", "n")) {
    message('"type" is not a valid value for this spec component. Ignoring.')
    return(vl)
  }

  if (is.null(field)) { stop('"field" must be specified', call.=FALSE) }

  vl$x$encoding$detail <- list(field=field, type=type)
  if (!is.null(aggregate)) vl$x$encoding$detail$aggregate <- aggregate
  if (!is.null(sort)) vl$x$encoding$order$sort <- sort

  vl

}

#' Encode detail "order"
#'
#' Grouping data is another important operation in visualizing data. For
#' aggregated plots, all encoded fields without aggregate functions are used as
#' grouping fields in the aggregation (similar to fields in GROUP BY in SQL).
#' For line and area marks, mapping a data field to color or shape channel will
#' group the lines and stacked areas by the field.\cr
#' \cr
#' order channel sorts the layer order or stacking order (for stacked charts) of
#' the marks while path channel sorts the order of data points in line marks.
#'
#' @param vl Vega-Lite object created by \code{\link{vegalite}}
#' @param field single element character vector naming the column
#' @param type the encoded field’s type of measurement. This can be either a full type
#'        name (\code{quantitative}, \code{temporal}, \code{ordinal}, and \code{nominal})
#'        or an initial character of the type name (\code{Q}, \code{T}, \code{O}, \code{N}).
#'        This property is case insensitive. If \code{auto} is used, the type will
#'        be guessed (so you may want to actually specify it if you want consistency).
#' @param aggregate perform aggregaton on \code{field}. See
#'        \href{http://vega.github.io/vega-lite/docs/aggregate.html}{Supported Aggregation Options} for
#'        more info on valid operations. Leave \code{NULL} for no aggregation.
#' @param sort either one of \code{ascending}, \code{descending} or (for ordinal scales)
#'        the result of a call to \code{\link{sort_def}}
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
#' @export
encode_order <- function(vl, field=NULL, type, aggregate=NULL, sort=NULL) {

  type <- tolower(type)
  if (type == "auto") type <- "quantitative"
  if (!type %in% c("quantitative", "temporal", "ordinal", "nominal", "q", "t", "o", "n")) {
    message('"type" is not a valid value for this spec component. Ignoring.')
    return(vl)
  }

  if (!is.null(aggregate)) vl$x$encoding$text$aggregate <- aggregate
  if (is.null(field)) { stop('"field" must be specified', call.=FALSE) }

  vl$x$encoding$order <- list(field=field, type=type)
  if (!is.null(sort)) vl$x$encoding$order$sort <- sort

  vl

}

#' Encode detail "path"
#'
#' Grouping data is another important operation in visualizing data. For
#' aggregated plots, all encoded fields without aggregate functions are used as
#' grouping fields in the aggregation (similar to fields in GROUP BY in SQL).
#' For line and area marks, mapping a data field to color or shape channel will
#' group the lines and stacked areas by the field.\cr
#' \cr
#' By default, line marks order their points in their paths by the field of
#' channel x or y. However, to show a pattern of data change over time between x & y
#' we use path channel to sort points in a paritcular order (e.g. by time).
#'
#' @param vl Vega-Lite object created by \code{\link{vegalite}}
#' @param field single element character vector naming the column
#' @param type the encoded field’s type of measurement. This can be either a full type
#'        name (\code{quantitative}, \code{temporal}, \code{ordinal}, and \code{nominal})
#'        or an initial character of the type name (\code{Q}, \code{T}, \code{O}, \code{N}).
#'        This property is case insensitive. If \code{auto} is used, the type will
#'        be guessed (so you may want to actually specify it if you want consistency).
#' @param aggregate perform aggregaton on \code{field}. See
#'        \href{http://vega.github.io/vega-lite/docs/aggregate.html}{Supported Aggregation Options} for
#'        more info on valid operations. Leave \code{NULL} for no aggregation.
#' @param sort either one of \code{ascending}, \code{descending} or (for ordinal scales)
#'        the result of a call to \code{\link{sort_def}}
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
#' @export
encode_path <- function(vl, field=NULL, type, aggregate=NULL, sort=NULL) {

  type <- tolower(type)
  if (type == "auto") type <- "quantitative"
  if (!type %in% c("quantitative", "temporal", "ordinal", "nominal", "q", "t", "o", "n")) {
    message('"type" is not a valid value for this spec component. Ignoring.')
    return(vl)
  }

  if (!is.null(aggregate)) vl$x$encoding$path$aggregate <- aggregate
  if (is.null(field)) { stop('"field" must be specified', call.=FALSE) }

  vl$x$encoding$path <- list(field=field, type=type)
  if (!is.null(sort)) vl$x$encoding$path$sort <- sort

  vl

}

