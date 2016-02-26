#' Create a horizontal ribbon of panels
#'
#' @export
facet_col <- function(vl, field, type, round=TRUE, padding=16) {
  vl$x$encoding$column <- list(field=field, type=type)
  vl$x$encoding$column$scale <- list(round=round, padding=padding)
  vl
}

#' Create a vertical ribbon of panels
#'
#' @export
facet_row <- function(vl, field, type, round=TRUE, padding=-16) {
  vl$x$encoding$row <- list(field=field, type=type)
  vl$x$encoding$row$scale <- list(round=round, padding=padding)
  vl
}

