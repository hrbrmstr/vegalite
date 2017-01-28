#' Encode all "channels"
#'
#' Vega-Lite has many "encoding channels". Each channel definition object must
#' describe the data field encoded by the channel and its data type, or a constant
#' value directly mapped to the mark properties. In addition, it can describe the
#' mapped field’s transformation and properties for its scale and guide.
#'
#' @param vl Vega-Lite object created by \code{\link{vegalite}}
#' @param chnl a channel to encode like x, y, color, shape, size, text, detail, order, path
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
#' @note right now, \code{type} == "\code{auto}" just assume "\code{quantitative}". It
#'       will eventually get smarter, but you are better off specifying it.
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
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

encode <- function(vl, chnl="x", field, type="auto", value=NULL, aggregate=NULL,
                   sort=NULL, padding=NULL, round=NULL) {
  if(is.null(field) & is.null(value)){
    # https://vega.github.io/vega-lite/docs/encoding.html#channels
    message('Each channel definition object must describe the "field" or "value".')
    return(vl)
  }

  if (!is.null(field)) {
    type <- tolower(type)
    if (type == "auto") type <- "quantitative"
    if (!type %in% c("quantitative", "temporal", "ordinal", "nominal", "q", "t", "o", "n")) {
      message('"type" is not a valid value for this spec component. Ignoring.')
      return(vl)
    }
    vl$x$encoding[[chnl]] <- list(field=field, type=type)
  } else {
    vl$x$encoding[[chnl]] <- list(value=value)
  }

  if (!is.null(aggregate)) vl$x$encoding[[chnl]]$aggregate <- aggregate
  if (!is.null(sort)) vl$x$encoding[[chnl]]$sort <- sort
  if (!is.null(round)) vl$x$encoding[[chnl]]$scale$round <- round
  if (!is.null(padding)) vl$x$encoding[[chnl]]$scale$padding <- padding

  vl

}

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
#' @note right now, \code{type} == "\code{auto}" just assume "\code{quantitative}". It
#'       will eventually get smarter, but you are better off specifying it.
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
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
encode_x <- function(vl, ...) {
  vl <- encode(vl, chnl="x", ...)

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
#' @note right now, \code{type} == "\code{auto}" just assume "\code{quantitative}". It
#'       will eventually get smarter, but you are better off specifying it.
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
encode_y <- function(vl, ...) {
  vl <- encode(vl, chnl="y", ...)

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
#' @note right now, \code{type} == "\code{auto}" just assume "\code{quantitative}". It
#'       will eventually get smarter, but you are better off specifying it.
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
encode_color <- function(vl, ...) {
  vl <- encode(vl, chnl="color", ...)

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
#' @note right now, \code{type} == "\code{auto}" just assume "\code{quantitative}". It
#'       will eventually get smarter, but you are better off specifying it.
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
encode_shape <- function(vl, ...) {
  vl <- encode(vl, chnl="shape", ...)

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
#' @note right now, \code{type} == "\code{auto}" just assume "\code{quantitative}". It
#'       will eventually get smarter, but you are better off specifying it.
#' @encoding UTF-8
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   encode_size("Acceleration", "quantitative") %>%
#'   mark_point()
encode_size <- function(vl, ...) {
  vl <- encode(vl, chnl="size", ...)

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
#' @note right now, \code{type} == "\code{auto}" just assume "\code{quantitative}". It
#'       will eventually get smarter, but you are better off specifying it.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
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
encode_text <- function(vl, ...) {
  vl <- encode(vl, chnl="text", ...)
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
#' @note right now, \code{type} == "\code{auto}" just assume "\code{quantitative}". It
#'       will eventually get smarter, but you are better off specifying it.
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
#' @export
#' @examples
#' vegalite() %>%
#'   cell_size(200, 200) %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/stocks.csv") %>%
#'   encode_x("date", "temporal") %>%
#'   encode_y("price", "quantitative") %>%
#'   encode_detail("symbol", "nominal") %>%
#'   mark_line()
encode_detail <- function(vl, field=NULL, type="auto", value=NULL, ...) {
  if(is.null(field)){
    message('"detail" channel requires the use of "field"', call.=FALSE)
    return(vl)
  }

  if(!is.null(value)){
    message('"value" is invalid for "detail" channel, using "field"')
  }

  vl <- encode(vl, chnl="detail", field=field, ...)

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
#' @note right now, \code{type} == "\code{auto}" just assume "\code{quantitative}". It
#'       will eventually get smarter, but you are better off specifying it.
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
#' @export
#' @examples
#' vegalite() %>%
#'   cell_size(200, 200) %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
#'   encode_x("Horsepower", "quantitative") %>%
#'   encode_y("Miles_per_Gallon", "quantitative") %>%
#'   encode_color("Origin", "nominal") %>%
#'   encode_order("Origin", "ordinal", sort="descending") %>%
#'   mark_point()
encode_order <- function(vl, field=NULL, type="auto", value=NULL, ...) {
  if(is.null(field)){
    message('"order" channel requires the use of "field"', call.=FALSE)
    return(vl)
  }

  if(!is.null(value)){
    message('"value" is invalid for "order" channel, using "field"')
  }

  vl <- encode(vl, chnl="order", field=field, ...)

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
#' @note right now, \code{type} == "\code{auto}" just assume "\code{quantitative}". It
#'       will eventually get smarter, but you are better off specifying it.
#' @references \href{http://vega.github.io/vega-lite/docs/encoding.html}{Vega-Lite Encoding spec}
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
encode_path <- function(vl, field=NULL, type="auto", value=NULL, ...) {
  if(is.null(field)){
    message('"path" channel requires the use of "field"', call.=FALSE)
    return(vl)
  }

  if(!is.null(value)){
    message('"value" is invalid for "path" channel, using "field"')
  }

  vl <- encode(vl, chnl="path", field=field, ...)

  vl
}


#' Create a horizontal ribbon of panels
#'
#' @param vl Vega-Lite object
#' @param field single element character vector naming the column.
#' @param type the encoded field’s type of measurement.
#' @param round round values
#' @param padding facet padding
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/facet.html}{Vega-Lite Faceting}
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
facet_col <- function(vl, field=NULL, type='auto',
                      round=TRUE, padding=16, value=NULL, ...) {
  if(is.null(field)){
    message('"column" channel requires the use of "field"', call.=FALSE)
    return(vl)
  }

  if(!is.null(value)){
    message('"value" is invalid for "column" channel, using "field"')
  }

  vl <- encode(vl, chnl='column', field=field, type=type, round=round, padding=padding, ...)
  vl
}

#' Create a vertical ribbon of panels
#'
#' @param vl Vega-Lite object
#' @param field single element character vector naming the column.
#' @param type the encoded field’s type of measurement.
#' @param round round values
#' @param padding facet padding
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/facet.html}{Vega-Lite Faceting}
#' @export
#' @examples
#' # see facet_col
facet_row <- function(vl, field=NULL, type='auto', round=TRUE, padding=16,
                      value=NULL, ...) {
  if(is.null(field)){
    message('"column" channel requires the use of "field"', call.=FALSE)
    return(vl)
  }

  if(!is.null(value)){
    message('"value" is invalid for "column" channel, using "field"')
  }

  vl <- encode(vl, chnl='row', field=field, type=type, round=round, padding=padding, ...)
  vl
}
