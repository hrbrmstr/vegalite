#' @export
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

#' @export
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
