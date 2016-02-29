#' Group continuous data values (x-axis)
#'
#' The "bin" property is for grouping quantitative, continuous data values of a
#' particular field into smaller number of “bins” (e.g., for a histogram).
#'
#' @param vl Vega-Lite object
#' @param min the minimum bin value to consider.
#' @param max the maximum bin value to consider.
#' @param base the number base to use for automatic bin determination.
#' @param step an exact step size to use between bins.
#' @param steps an array of allowable step sizes to choose from.
#' @param minstep minimum allowable step size (particularly useful for integer values).
#' @param div Scale factors indicating allowable subdivisions. The default value is
#'        [5, 2], which indicates that for base 10 numbers (the default base),
#'        the method may consider dividing bin sizes by 5 and/or 2. For example,
#'        for an initial step size of 10, the method can check if bin sizes of 2
#'        (= 10/5), 5 (= 10/2), or 1 (= 10/(5*2)) might also satisfy the given
#'         constraints.
#' @param maxbins the maximum number of allowable bins.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/bin.html}{Vega-Lite Binning}
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
#'   encode_x("IMDB_Rating", "quantitative") %>%
#'   encode_y("Rotten_Tomatoes_Rating", "quantitative") %>%
#'   encode_size("*", "quantitative", aggregate="count") %>%
#'   bin_x(maxbins=10) %>%
#'   bin_y(maxbins=10) %>%
#'   mark_point()
bin_x <- function(vl, min=NULL, max=NULL, base=NULL, step=NULL,
                  steps=NULL, minstep=NULL, div=NULL, maxbins=NULL) {

  chnl <- "x"

  if (!is.null(min))     vl$x$encoding[[chnl]]$bin$min <- min
  if (!is.null(max))     vl$x$encoding[[chnl]]$bin$max <- max
  if (!is.null(base))    vl$x$encoding[[chnl]]$bin$base <- base
  if (!is.null(step))    vl$x$encoding[[chnl]]$bin$grid <- step
  if (!is.null(steps))   vl$x$encoding[[chnl]]$bin$labels <- steps
  if (!is.null(minstep)) vl$x$encoding[[chnl]]$bin$minstep <- minstep
  if (!is.null(div))     vl$x$encoding[[chnl]]$bin$div <- div
  if (!is.null(maxbins)) vl$x$encoding[[chnl]]$bin$maxbins <- maxbins

  if (length( vl$x$encoding[[chnl]]$bin) == 0) vl$x$encoding$x$bin <- TRUE

  vl

}

#' Group continuous data values (y-axis)
#'
#' The "bin" property is for grouping quantitative, continuous data values of a
#' particular field into smaller number of “bins” (e.g., for a histogram).
#'
#' @param vl Vega-Lite object
#' @param min the minimum bin value to consider.
#' @param max the maximum bin value to consider.
#' @param base the number base to use for automatic bin determination.
#' @param step an exact step size to use between bins.
#' @param steps an array of allowable step sizes to choose from.
#' @param minstep minimum allowable step size (particularly useful for integer values).
#' @param div Scale factors indicating allowable subdivisions. The default value is
#'        [5, 2], which indicates that for base 10 numbers (the default base),
#'        the method may consider dividing bin sizes by 5 and/or 2. For example,
#'        for an initial step size of 10, the method can check if bin sizes of 2
#'        (= 10/5), 5 (= 10/2), or 1 (= 10/(5*2)) might also satisfy the given
#'         constraints.
#' @param maxbins the maximum number of allowable bins.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/bin.html}{Vega-Lite Binning}
#' @export
#' @examples
#' vegalite() %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
#'   encode_x("IMDB_Rating", "quantitative") %>%
#'   encode_y("Rotten_Tomatoes_Rating", "quantitative") %>%
#'   encode_size("*", "quantitative", aggregate="count") %>%
#'   bin_x(maxbins=10) %>%
#'   bin_y(maxbins=10) %>%
#'   mark_point()
bin_y <- function(vl, min=NULL, max=NULL, base=NULL, step=NULL,
                  steps=NULL, minstep=NULL, div=NULL, maxbins=NULL) {

  chnl <- "y"

  if (!is.null(min))     vl$x$encoding[[chnl]]$bin$min <- min
  if (!is.null(max))     vl$x$encoding[[chnl]]$bin$max <- max
  if (!is.null(base))    vl$x$encoding[[chnl]]$bin$base <- base
  if (!is.null(step))    vl$x$encoding[[chnl]]$bin$grid <- step
  if (!is.null(steps))   vl$x$encoding[[chnl]]$bin$labels <- steps
  if (!is.null(minstep)) vl$x$encoding[[chnl]]$bin$minstep <- minstep
  if (!is.null(div))     vl$x$encoding[[chnl]]$bin$div <- div
  if (!is.null(maxbins)) vl$x$encoding[[chnl]]$bin$maxbins <- maxbins

  if (length( vl$x$encoding[[chnl]]$bin) == 0) vl$x$encoding$y$bin <- TRUE

  vl

}
