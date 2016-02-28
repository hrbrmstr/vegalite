#' Legend settings (color)
#'
#' @param vl a Vega-Lite object
#' @param orient the orientation of the legend. One of "left" or "right". This
#'         determines how the legend is positioned within the scene.
#' @param title the title for the legend.
#' @param format the formatting pattern for axis labels. This is D3’s number
#'        format pattern for quantitative axis and D3’s time format pattern
#'        for time axis.
#' @param short_time_labels whether month and day names should be abbreviated.
#' @param value explicitly set the visible legend values.
#' @param remove if \code{TRUE}, there will be no legend for this aesthetic.
#' @encoding UTF-8
#' @export
legend_color <- function(vl, orient=NULL, title=NULL,
                         format=NULL, short_time_labels=NULL,
                         value=NULL, remove=FALSE) {

  chnl <- "color"

  if (remove) {
    vl$x$encoding[[chnl]]$legend <- FALSE
  } else {
    if (!is.null(orient))            vl$x$encoding[[chnl]]$legend$orient <- orient
    if (!is.null(title))             vl$x$encoding[[chnl]]$legend$title <- title
    if (!is.null(format))            vl$x$encoding[[chnl]]$legend$format <- format
    if (!is.null(short_time_labels)) vl$x$encoding[[chnl]]$legend$shortTimeLabels <-
                                       short_time_labels
    if (!is.null(value))             vl$x$encoding[[chnl]]$legend$value <- value
  }

  vl

}

#' Legend settings (size)
#'
#' @param vl a Vega-Lite object
#' @param orient the orientation of the legend. One of "left" or "right". This
#'         determines how the legend is positioned within the scene.
#' @param title the title for the legend.
#' @param format the formatting pattern for axis labels. This is D3’s number
#'        format pattern for quantitative axis and D3’s time format pattern
#'        for time axis.
#' @param short_time_labels whether month and day names should be abbreviated.
#' @param value explicitly set the visible legend values.
#' @param remove if \code{TRUE}, there will be no legend for this aesthetic.
#' @encoding UTF-8
#' @export
legend_size <- function(vl, orient=NULL, title=NULL,
                         format=NULL, short_time_labels=NULL,
                         value=NULL, remove=FALSE) {

  chnl <- "size"

  if (remove) {
    vl$x$encoding[[chnl]]$legend <- FALSE
  } else {
    if (!is.null(orient))            vl$x$encoding[[chnl]]$legend$orient <- orient
    if (!is.null(title))             vl$x$encoding[[chnl]]$legend$title <- title
    if (!is.null(format))            vl$x$encoding[[chnl]]$legend$format <- format
    if (!is.null(short_time_labels)) vl$x$encoding[[chnl]]$legend$shortTimeLabels <-
                                       short_time_labels
    if (!is.null(value))             vl$x$encoding[[chnl]]$legend$value <- value
  }

  vl

}

#' Legend settings (shape)
#'
#' @param vl a Vega-Lite object
#' @param orient the orientation of the legend. One of "left" or "right". This
#'         determines how the legend is positioned within the scene.
#' @param title the title for the legend.
#' @param format the formatting pattern for axis labels. This is D3’s number
#'        format pattern for quantitative axis and D3’s time format pattern
#'        for time axis.
#' @param short_time_labels whether month and day names should be abbreviated.
#' @param value explicitly set the visible legend values.
#' @param remove if \code{TRUE}, there will be no legend for this aesthetic.
#' @encoding UTF-8
#' @export
legend_shape <- function(vl, orient=NULL, title=NULL,
                         format=NULL, short_time_labels=NULL,
                         value=NULL, remove=FALSE) {

  chnl <- "shape"

  if (remove) {
    vl$x$encoding[[chnl]]$legend <- FALSE
  } else {
    if (!is.null(orient))            vl$x$encoding[[chnl]]$legend$orient <- orient
    if (!is.null(title))             vl$x$encoding[[chnl]]$legend$title <- title
    if (!is.null(format))            vl$x$encoding[[chnl]]$legend$format <- format
    if (!is.null(short_time_labels)) vl$x$encoding[[chnl]]$legend$shortTimeLabels <-
                                       short_time_labels
    if (!is.null(value))             vl$x$encoding[[chnl]]$legend$value <- value
  }

  vl

}
