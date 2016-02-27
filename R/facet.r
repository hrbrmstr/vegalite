#' Create a horizontal ribbon of panels
#'
#' @param vl Vega-Lite object
#' @param field single element character vector naming the column.
#' @param type the encoded field’s type of measurement.
#' @param round round values
#' @param padding facet padding
#' @references \href{http://vega.github.io/vega-lite/docs/facet.html}{Vega-Lite Faceting}
#' @export
facet_col <- function(vl, field, type, round=TRUE, padding=16) {
  vl$x$encoding$column <- list(field=field, type=type)
  vl$x$encoding$column$scale <- list(round=round, padding=padding)
  vl
}

#' Create a vertical ribbon of panels
#'
#' @param vl Vega-Lite object
#' @param field single element character vector naming the column.
#' @param type the encoded field’s type of measurement.
#' @param round round values
#' @param padding facet padding
#' @references \href{http://vega.github.io/vega-lite/docs/facet.html}{Vega-Lite Faceting}
#' @export
facet_row <- function(vl, field, type, round=TRUE, padding=16) {
  vl$x$encoding$row <- list(field=field, type=type)
  vl$x$encoding$row$scale <- list(round=round, padding=padding)
  vl
}

