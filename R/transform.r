#' Filter 'null' values
#'
#' Whether to filter null values from the data.
#'
#' @param vl Vega-Lite object created by \code{\link{vegalite}}
#' @param setting if \code{NULL} only quantitative and temporal fields are
#'        filtered. If \code{TRUE}, all data items with 'null' values are
#'        filtered. If \code{FALSE}, all data items are included.
#' @export
filter_null <- function(vl, setting=NULL) {
  if (!is.null(setting)) { vl$x$transform$filterNull <- setting }
  vl
}

#' Derive new fields
#'
#' @param vl Vega-Lite object created by \code{\link{vegalite}}
#' @param field the field name in which to store the computed value.
#' @param expr a string containing an expression for the formula. Use the variable
#'        \code{"datum"} to refer to the current data object.
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
calculate <- function(vl, field, expr) {

  tmp <- data.frame(field=field, expr=expr, stringsAsFactors=FALSE)

  if (length(vl$x$transform$calculate) == 0) {
    vl$x$transform$calculate <- tmp
  } else {
     vl$x$transform$calculate <- rbind.data.frame(vl$x$transform$calculate, tmp)
  }

  vl

}

#' Add a filter
#'
#' @param vl Vega-Lite object created by \code{\link{vegalite}}
#' @param expr Vega Expression for filtering data items (or rows). Each datum
#'   object can be referred using bound variable datum. For example, setting
#'   \code{expr} to \code{"datum.datum.b2 > 60"} would make the output data includes only
#'   items that have values in the field \code{b2} over 60.
#' @export
#' @examples
#' vegalite(viewport_height=200, viewport_width=200) %>%
#'   cell_size(200, 200) %>%
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
add_filter <- function(vl, expr) {
   vl$x$transform$filter <- expr
   vl
}