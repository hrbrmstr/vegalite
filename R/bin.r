#' @export
bin_x <- function(vl, maxbins, min, max, base, step, steps, minstep, div) {
  arg <- as.list(match.call())
  if ((length(arg) == 2) & ("vl" %in% names(arg))) {
    vl$x$encoding$x$bin <- TRUE
  } else {
    arg[[1]] <- NULL
    arg$vl <- NULL
    vl$x$encoding$x$bin <- arg
  }
  vl
}

#' @export
bin_y <- function(vl, maxbins, min, max, base, step, steps, minstep, div) {
  arg <- as.list(match.call())
  if ((length(arg) == 2) & ("vl" %in% names(arg))) {
    vl$x$encoding$y$bin <- TRUE
  } else {
    arg[[1]] <- NULL
    arg$vl <- NULL
    vl$x$encoding$y$bin <- arg
  }
  vl
}
