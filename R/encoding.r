#' Encode x "channel"
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
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
#' @export
encode_x <- function(vl, field, type="auto") {
  type <- tolower(type)
  if (type == "auto") type <- "quantitative"
  if (!type %in% c("quantitative", "temporal", "ordinal", "nominal", "q", "t", "o", "n")) {
    message('"type" is not a valid value for this spec component. Ignoring.')
    return(vl)
  }
  vl$x$encoding$x <- list(field=field, type=type)
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
#' @export
encode_y <- function(vl, field, type="auto") {
  type <- tolower(type)
  if (type == "auto") type <- "quantitative"
  if (!type %in% c("quantitative", "temporal", "ordinal", "nominal", "q", "t", "o", "n")) {
    message('"type" is not a valid value for this spec component. Ignoring.')
    return(vl)
  }
  vl$x$encoding$y <- list(field=field, type=type)
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
#' @param value if a field is not specified, constant values for the properties
#'        (e.g., color, size) can be also set directly with the channel definition’s value property.
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   encode_color("Origin", "nominal") %>%
#'   encode_shape("Origin", "nominal") %>%
#'   mark_point()
encode_color <- function(vl, field=NULL, type, value=NULL) {

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
#' @param value if a field is not specified, constant values for the properties
#'        (e.g., color, size) can be also set directly with the channel definition’s value property.
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   encode_color("Origin", "nominal") %>%
#'   encode_shape("Origin", "nominal") %>%
#'   mark_point()
encode_shape <- function(vl, field=NULL, type, value=NULL) {

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

  vl

}

#' Encode size "channel"
#'
#' @param vl Vega-Lite object created by \code{\link{vegalite}}
#' @param field single element character vector naming the column
#' @param type the encoded field’s type of measurement. This can be either a full type
#'        name (\code{quantitative}, \code{temporal}, \code{ordinal}, and \code{nominal})
#'        or an initial character of the type name (\code{Q}, \code{T}, \code{O}, \code{N}).
#'        This property is case insensitive. If \code{auto} is used, the type will
#'        be guessed (so you may want to actually specify it if you want consistency).
#' @param value if a field is not specified, constant values for the properties
#'        (e.g., color, size) can be also set directly with the channel definition’s value property.
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   encode_size("Acceleration", "quantitative") %>%
#'   mark_point()
encode_size <- function(vl, field=NULL, type, value=NULL) {

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
#' @param value if a field is not specified, constant values for the properties
#'        (e.g., color, size) can be also set directly with the channel definition’s value property.
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
#' @export
encode_shape<- function(vl, field=NULL, type, value=NULL) {

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

  vl

}

#' Encode text "channel"
#'
#' @param vl Vega-Lite object created by \code{\link{vegalite}}
#' @param field single element character vector naming the column
#' @param type the encoded field’s type of measurement. This can be either a full type
#'        name (\code{quantitative}, \code{temporal}, \code{ordinal}, and \code{nominal})
#'        or an initial character of the type name (\code{Q}, \code{T}, \code{O}, \code{N}).
#'        This property is case insensitive. If \code{auto} is used, the type will
#'        be guessed (so you may want to actually specify it if you want consistency).
#' @param value if a field is not specified, constant values for the properties
#'        (e.g., color, size) can be also set directly with the channel definition’s value property.
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
#' @export
encode_text <- function(vl, field, type, value) {
  message("Not implemented yet")
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
#' @param vl Vega-Lite object created by \code{\link{vegalite}}
#' @param field single element character vector naming the column
#' @param type the encoded field’s type of measurement. This can be either a full type
#'        name (\code{quantitative}, \code{temporal}, \code{ordinal}, and \code{nominal})
#'        or an initial character of the type name (\code{Q}, \code{T}, \code{O}, \code{N}).
#'        This property is case insensitive. If \code{auto} is used, the type will
#'        be guessed (so you may want to actually specify it if you want consistency).
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
#' @export
encode_detail <- function(vl, field=NULL, type) {

  type <- tolower(type)
  if (type == "auto") type <- "quantitative"
  if (!type %in% c("quantitative", "temporal", "ordinal", "nominal", "q", "t", "o", "n")) {
    message('"type" is not a valid value for this spec component. Ignoring.')
    return(vl)
  }

  if (is.null(field)) {
    stop('"field" must be specified', call.=FALSE)
  }

  vl$x$encoding$detail <- list(field=field, type=type)

  vl

}
