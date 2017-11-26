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
#'   scale_x_ordinal_vl(range_step=8) %>%
#'   scale_color_nominal_vl(range=c("#EA98D2", "#659CCA")) %>%
#'   facet_col("age", "ordinal", padding=4) %>%
#'   axis_x(remove=TRUE) %>%
#'   axis_y(title="population", grid=FALSE) %>%
#'   view_config(stroke_width=0) %>%
#'   mark_bar()
calculate <- function(vl, field, expr) {


  new_calculate <- list(list("calculate" = expr,
                             "as" = field))
  vl$x$transform <- append(vl$x$transform, new_calculate)
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
#'   view_size(200, 200) %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/population.json") %>%
#'   add_filter("datum.year == 2000") %>%
#'   calculate("gender", 'datum.sex == 2 ? "Female" : "Male"') %>%
#'   encode_x("gender", "nominal") %>%
#'   encode_y("people", "quantitative", aggregate="sum") %>%
#'   encode_color("gender", "nominal") %>%
#'   scale_x_ordinal_vl(range_step=8) %>%
#'   scale_color_nominal_vl(range=c("#EA98D2", "#659CCA")) %>%
#'   facet_col("age", "ordinal", padding=4) %>%
#'   axis_x(remove=TRUE) %>%
#'   axis_y(title="population", grid=FALSE) %>%
#'   view_config(stroke_width=0) %>%
#'   mark_bar()
add_filter <- function(vl, expr) {

  new_filter <- list(list("filter" = expr))
  vl$x$transform <- append(vl$x$transform, new_filter)
  vl
}
