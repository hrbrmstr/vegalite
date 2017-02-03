vl <- wdgt_png_tf <- NULL

#' General axis settings (all)
#'
#' axis_vl provide axis lines, ticks and labels to convey how a spatial range represents
#' a data range. Simply put, axes visualize scales. \cr
#' \cr
#' By default, Vega-Lite automatically creates axes for x, y, row, and column channels
#' when they are encoded. Axis can be customized via the axis property of a channel
#' definition. \cr
#' \cr
#' The axis_vl function works with all possible channels, but axis_x, axis_y, axis_facet_row
#' and axis_facet_col are offered as conveniences.
#'
#' @param vl Vega-Lite object
#' @param chnl
#'        x, y, column, or row
#' @param axisColor,axisWidth,offset,orient,zindex
#'        see \href{https://vega.github.io/vega-lite/docs/axis.html#general}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @param grid,gridColor,gridDash,gridOpacity,gridWidth
#'        see \href{https://vega.github.io/vega-lite/docs/axis.html#grid}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @param labels,format,labelAngle,labelAlign,labelBaseline,labelMaxLength,shortTimeLabels
#'        see \href{https://vega.github.io/vega-lite/docs/axis.html#labels}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @param subdivide,ticks,tickColor,tickLabelColor,tickLabelFont,tickLabelFontSize,tickPadding,tickSize,tickSizeMajor,tickSizeMinor,tickSizeEnd,tickWidth,values
#'        see \href{https://vega.github.io/vega-lite/docs/axis.html#ticks}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @param title,titleColor,titleFont,titleFontWeight,titleFontSize,titleOffset,titleMaxLength,characterWidth
#'        see \href{https://vega.github.io/vega-lite/docs/axis.html#title}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @param remove
#'        see \href{http://vega.github.io/vega-lite/docs/axis.html}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/axis.html}{Vega-List Axis spec}
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
#'

axis_vl <- function(vl, chnl = "x", axisColor=NULL, axisWidth=NULL, offset=NULL,
                    orient=NULL, zindex=NULL, grid=NULL, gridColor=NULL,
                    gridDash=NULL, gridOpacity=NULL, gridWidth=NULL,
                    labels=TRUE, format=NULL, labelAngle=NULL, labelAlign=NULL,
                    labelBaseline=NULL, labelMaxLength=25, shortTimeLabels=NULL,
                    subdivide=NULL, ticks=NULL, tickColor=NULL,
                    tickLabelColor=NULL, tickLabelFont=NULL,
                    tickLabelFontSize=NULL, tickPadding=NULL, tickSize=NULL,
                    tickSizeMajor=NULL, tickSizeMinor=NULL, tickSizeEnd=NULL,
                    tickWidth=NULL, values=NULL, title="", titleColor=NULL,
                    titleFont=NULL, titleFontWeight=NULL, titleFontSize=NULL,
                    titleOffset=NULL, titleMaxLength=NULL, characterWidth=6,
                    remove=FALSE) {

  if (remove) {
    vl$x$encoding[[chnl]]$axis <- FALSE
  } else {
    if (!is.null(axisColor))          vl$x$encoding[[chnl]]$axis$axisColor <- axisColor
    if (!is.null(zindex))             vl$x$encoding[[chnl]]$axis$zindex <- zindex
    if (!is.null(axisWidth))          vl$x$encoding[[chnl]]$axis$axisWidth <- axisWidth
    if (!is.null(offset))             vl$x$encoding[[chnl]]$axis$offset <- offset
    if (!is.null(grid))               vl$x$encoding[[chnl]]$axis$grid <- grid
    if (!is.null(gridColor))          vl$x$encoding[[chnl]]$axis$gridColor <- gridColor
    if (!is.null(gridDash))           vl$x$encoding[[chnl]]$axis$gridDash <- gridDash
    if (!is.null(gridOpacity))        vl$x$encoding[[chnl]]$axis$gridOpacity <- gridOpacity
    if (!is.null(gridWidth))          vl$x$encoding[[chnl]]$axis$gridWidth <- gridWidth
    if (!is.null(labels))             vl$x$encoding[[chnl]]$axis$labels <- labels
    if (!is.null(labelAngle))         vl$x$encoding[[chnl]]$axis$labelAngle <- labelAngle
    if (!is.null(labelAlign))         vl$x$encoding[[chnl]]$axis$labelAlign <- labelAlign
    if (!is.null(labelBaseline))      vl$x$encoding[[chnl]]$axis$labelBaseline <- labelBaseline
    if (!is.null(labelMaxLength))     vl$x$encoding[[chnl]]$axis$labelMaxLength <- labelMaxLength
    if (!is.null(shortTimeLabels))    vl$x$encoding[[chnl]]$axis$shortTimeLabels <- shortTimeLabels
    if (!is.null(subdivide))          vl$x$encoding[[chnl]]$axis$subdivide <- subdivide
    if (!is.null(ticks))              vl$x$encoding[[chnl]]$axis$ticks <- ticks
    if (!is.null(tickColor))          vl$x$encoding[[chnl]]$axis$tickColor <- tickColor
    if (!is.null(tickLabelColor))     vl$x$encoding[[chnl]]$axis$tickLabelColor <- tickLabelColor
    if (!is.null(tickLabelFont))      vl$x$encoding[[chnl]]$axis$tickLabelFont <- tickLabelFont
    if (!is.null(tickLabelFontSize))  vl$x$encoding[[chnl]]$axis$tickColor <- tickLabelFontSize
    if (!is.null(tickWidth))          vl$x$encoding[[chnl]]$axis$tickWidth <- tickWidth
    if (!is.null(tickPadding))        vl$x$encoding[[chnl]]$axis$tickPadding <- tickPadding
    if (!is.null(tickSize))           vl$x$encoding[[chnl]]$axis$tickSize <- tickSize
    if (!is.null(tickSizeMajor))      vl$x$encoding[[chnl]]$axis$tickSizeMajor <- tickSizeMajor
    if (!is.null(tickSizeMinor))      vl$x$encoding[[chnl]]$axis$tickSizeMinor <- tickSizeMinor
    if (!is.null(tickSizeEnd))        vl$x$encoding[[chnl]]$axis$tickSizeEnd <- tickSizeEnd
    if (!is.null(values))             vl$x$encoding[[chnl]]$axis$values <- values
    if (!is.null(title))              vl$x$encoding[[chnl]]$axis$title <- title
    if (!is.null(titleColor))         vl$x$encoding[[chnl]]$axis$titleColor <- titleColor
    if (!is.null(titleFont))          vl$x$encoding[[chnl]]$axis$titleFont <- titleFont
    if (!is.null(titleFontWeight))    vl$x$encoding[[chnl]]$axis$titleFontWeight <- titleFontWeight
    if (!is.null(titleFontSize))      vl$x$encoding[[chnl]]$axis$titleFontSize <- titleFontSize
    if (!is.null(titleOffset))        vl$x$encoding[[chnl]]$axis$titleOffset <- titleOffset
    if (!is.null(titleMaxLength))     vl$x$encoding[[chnl]]$axis$titleMaxLength <- titleMaxLength
    if (!is.null(characterWidth))     vl$x$encoding[[chnl]]$axis$characterWidth <- characterWidth
    if (!is.null(orient))             vl$x$encoding[[chnl]]$axis$orient <- orient
    if (!is.null(format))             vl$x$encoding[[chnl]]$axis$format <- format
  }

  vl

}

#' @rdname axis_vl
#' @export
axis_x <- function(vl, ...) {
  vl <- axis_vl(vl, chnl = "x", ...)
  vl
}

#' @rdname axis_vl
#' @export
axis_y <- function(vl, ...) {
  vl <- axis_vl(vl, chnl = "y", ...)
  vl
}

#' @rdname axis_vl
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

axis_facet_col <- function(vl, ...) {
  vl <- axis_vl(vl, chnl = "column", ...)
  vl
}


#' @rdname axis_vl
#' @export
axis_facet_row <- function(vl, ...) {
  vl <- axis_vl(vl, chnl = "row", ...)
  vl
}
