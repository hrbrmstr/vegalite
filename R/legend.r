#' Legend settings (all)
#'
#' @param vl a Vega-Lite object
#' @param chnl a channel, by default vegalite creates legends for color, size, and shape
#' @param orient,offset,values
#'        see \href{https://vega.github.io/vega-lite/docs/legend.html#general}{legend docs}
#' @param format,labelAlign,labelBaseline,labelColor,labelFont,labelFontSize,short_time_labels
#'        see \href{https://vega.github.io/vega-lite/docs/legend.html#labels}{legend docs}
#' @param symbolColor,symbolShape,symbolSize,symbolStrokeWidth
#'        see \href{https://vega.github.io/vega-lite/docs/legend.html#symbols}{legend docs}
#' @param title,titleColor,titleFont,titleFontSize,titleFontWeight
#'        see \href{https://vega.github.io/vega-lite/docs/legend.html#title}{legend docs}
#' @param remove if \code{TRUE}, there will be no legend for this aesthetic.
#' @encoding UTF-8
#' @export

legend_vl <- function(vl, chnl="color", orient=NULL, offset=NULL, values=NULL,
                      format=NULL, labelAlign=NULL, labelBaseline=NULL,
                      labelColor=NULL, labelFont=NULL, labelFontSize=NULL,
                      short_time_labels=NULL, symbolColor=NULL,
                      symbolShape=NULL, symbolSize=NULL, symbolStrokeWidth=NULL,
                      title=NULL, titleColor=NULL, titleFont=NULL,
                      titleFontSize=NULL, titleFontWeight=NULL, remove=FALSE) {


  if (remove) {
    vl$x$encoding[[chnl]]$legend <- FALSE
  } else {
    if (!is.null(orient))            vl$x$encoding[[chnl]]$legend$orient <- orient
    if (!is.null(offset))            vl$x$encoding[[chnl]]$legend$offset <- offset
    if (!is.null(values))            vl$x$encoding[[chnl]]$legend$values <- values
    if (!is.null(format))            vl$x$encoding[[chnl]]$legend$format <- format
    if (!is.null(labelAlign))        vl$x$encoding[[chnl]]$legend$labelAlign <- labelAlign
    if (!is.null(labelBaseline))     vl$x$encoding[[chnl]]$legend$labelBaseline <- labelBaseline
    if (!is.null(labelColor))        vl$x$encoding[[chnl]]$legend$labelColor <- labelColor
    if (!is.null(labelFont))         vl$x$encoding[[chnl]]$legend$labelFont <- labelFont
    if (!is.null(labelFontSize))     vl$x$encoding[[chnl]]$legend$labelFontSize <- labelFontSize
    if (!is.null(short_time_labels)) vl$x$encoding[[chnl]]$legend$short_time_labels <- short_time_labels
    if (!is.null(symbolColor))       vl$x$encoding[[chnl]]$legend$symbolColor <- symbolColor
    if (!is.null(symbolShape))       vl$x$encoding[[chnl]]$legend$symbolShape <- symbolShape
    if (!is.null(symbolSize))        vl$x$encoding[[chnl]]$legend$symbolSize <- symbolSize
    if (!is.null(symbolStrokeWidth)) vl$x$encoding[[chnl]]$legend$symbolStrokeWidth <- symbolStrokeWidth
    if (!is.null(title))             vl$x$encoding[[chnl]]$legend$title <- title
    if (!is.null(titleColor))        vl$x$encoding[[chnl]]$legend$titleColor <- titleColor
    if (!is.null(titleFont))         vl$x$encoding[[chnl]]$legend$titleFont <- titleFont
    if (!is.null(titleFontSize))     vl$x$encoding[[chnl]]$legend$titleFontSize <- titleFontSize
    if (!is.null(titleFontWeight))   vl$x$encoding[[chnl]]$legend$titleFontWeight <- titleFontWeight
  }

  vl

}


#' @rdname legend_vl
#' @export
legend_color <- function(vl, ...) {
  vl <- legend_vl(vl, chnl="color", ...)
  vl
}

#' @rdname legend_vl
#' @export
legend_size <- function(vl, ...) {
  vl <- legend_vl(vl, chnl="size", ...)
  vl
}

#' @rdname legend_vl
#' @export
legend_shape <- function(vl, ...) {
  vl <- legend_vl(vl, chnl="shape", ...)
  vl
}
