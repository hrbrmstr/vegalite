#' Create a horizontal ribbon of panels
#'
#' @export
facet_col <- function(vl, field, type) {
  vl$x$encoding$column <- list(field=field, type=type)
  vl
}

#' Create a vertical ribbon of panels
#'
#' @export
facet_row <- function(vl, field, type) {
  vl$x$encoding$row <- list(field=field, type=type)
  vl
}

