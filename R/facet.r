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
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/facet.html}{Vega-Lite Faceting}
#' @export
#' @examples
#' # see facet_col
facet_row <- function(vl, field, type, round=TRUE, padding=16) {
  vl$x$encoding$row <- list(field=field, type=type)
  vl$x$encoding$row$scale <- list(round=round, padding=padding)
  vl
}

