#' Create a horizontal ribbon of panels
#'
#' @export
facet_col <- function(vl, field, type) {
  vl$x$facet$col <- list(field=field,
                         type=type)
  vl$x$hasFacetCol <- TRUE
  vl
}

#' Create a vertical ribbon of panels
#'
#' @export
facet_row <- function(vl, field, type) {
  vl$x$facet$row <- list(field=field,
                         type=type)
  vl$x$hasFacetRow <- TRUE
  vl
}

