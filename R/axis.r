vl <- wdgt_png_tf <- NULL

#' General axis setttings (x-axis)
#'
#' Axes provide axis lines, ticks and labels to convey how a spatial range represents
#' a data range. Simply put, axes visualize scales. \cr
#' \cr
#' By default, Vega-Lite automatically creates axes for x, y, row, and column channels
#' when they are encoded. Axis can be customized via the axis property of a channel
#' definition.
#'
#' @param vl Vega-Lite object
#' @param axisWidth,layer,offset,grid,labels,labelAngle,labelAlign,labelBaseline
#'        see \href{http://vega.github.io/vega-lite/docs/axis.html}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @param labelMaxLength,shortTimeLabels,subdivide,ticks,tickPadding,tickSize
#'        see \href{http://vega.github.io/vega-lite/docs/axis.html}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @param tickSizeMajor,tickSizeMinor,tickSizeEnd,title,titleOffset,titleMaxLength
#'        see \href{http://vega.github.io/vega-lite/docs/axis.html}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @param characterWidth,orient,format,remove
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
axis_x <- function(vl, axisWidth=NULL, layer=NULL, offset=NULL, grid=NULL, labels=TRUE,
                   labelAngle=NULL, labelAlign=NULL, labelBaseline=NULL, labelMaxLength=25,
                   shortTimeLabels=NULL, subdivide=NULL, ticks=NULL, tickPadding=NULL,
                   tickSize=NULL, tickSizeMajor=NULL, tickSizeMinor=NULL, tickSizeEnd=NULL,
                   title="", titleOffset=NULL, titleMaxLength=NULL, characterWidth=6,
                   orient=NULL, format=NULL, remove=FALSE) {

  chnl <- "x"

  if (remove) {
    vl$x$encoding[[chnl]]$axis <- FALSE
  } else {
    if (!is.null(axisWidth))       vl$x$encoding[[chnl]]$axis$axisWidth <- axisWidth
    if (!is.null(layer))           vl$x$encoding[[chnl]]$axis$layer <- layer
    if (!is.null(offset))          vl$x$encoding[[chnl]]$axis$offset <- offset
    if (!is.null(grid))            vl$x$encoding[[chnl]]$axis$grid <- grid
    if (!is.null(labels))          vl$x$encoding[[chnl]]$axis$labels <- labels
    if (!is.null(labelAngle))      vl$x$encoding[[chnl]]$axis$labelAngle <- labelAngle
    if (!is.null(labelAlign))      vl$x$encoding[[chnl]]$axis$labelAlign <- labelAlign
    if (!is.null(labelBaseline))   vl$x$encoding[[chnl]]$axis$labelBaseline <- labelBaseline
    if (!is.null(labelMaxLength))  vl$x$encoding[[chnl]]$axis$labelMaxLength <- labelMaxLength
    if (!is.null(shortTimeLabels)) vl$x$encoding[[chnl]]$axis$shortTimeLabels <- shortTimeLabels
    if (!is.null(subdivide))       vl$x$encoding[[chnl]]$axis$subdivide <- subdivide
    if (!is.null(ticks))           vl$x$encoding[[chnl]]$axis$ticks <- ticks
    if (!is.null(tickPadding))     vl$x$encoding[[chnl]]$axis$tickPadding <- tickPadding
    if (!is.null(tickSize))        vl$x$encoding[[chnl]]$axis$tickSize <- tickSize
    if (!is.null(tickSizeMajor))   vl$x$encoding[[chnl]]$axis$tickSizeMajor <- tickSizeMajor
    if (!is.null(tickSizeMinor))   vl$x$encoding[[chnl]]$axis$tickSizeMinor <- tickSizeMinor
    if (!is.null(tickSizeEnd))     vl$x$encoding[[chnl]]$axis$tickSizeEnd <- tickSizeEnd
    if (!is.null(title))           vl$x$encoding[[chnl]]$axis$title <- title
    if (!is.null(titleOffset))     vl$x$encoding[[chnl]]$axis$titleOffset <- titleOffset
    if (!is.null(titleMaxLength))  vl$x$encoding[[chnl]]$axis$titleMaxLength <- titleMaxLength
    if (!is.null(characterWidth))  vl$x$encoding[[chnl]]$axis$characterWidth <- characterWidth
    if (!is.null(orient))          vl$x$encoding[[chnl]]$axis$orient <- orient
    if (!is.null(format))          vl$x$encoding[[chnl]]$axis$format <- format
  }

  vl

}

#' General axis setttings (y-axis)
#'
#' Axes provide axis lines, ticks and labels to convey how a spatial range represents
#' a data range. Simply put, axes visualize scales. \cr
#' \cr
#' By default, Vega-Lite automatically creates axes for x, y, row, and column channels
#' when they are encoded. Axis can be customized via the axis property of a channel
#' definition.
#'
#' @param vl Vega-Lite object
#' @param axisWidth,layer,offset,grid,labels,labelAngle,labelAlign,labelBaseline
#'        see \href{http://vega.github.io/vega-lite/docs/axis.html}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @param labelMaxLength,shortTimeLabels,subdivide,ticks,tickPadding,tickSize
#'        see \href{http://vega.github.io/vega-lite/docs/axis.html}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @param tickSizeMajor,tickSizeMinor,tickSizeEnd,title,titleOffset,titleMaxLength
#'        see \href{http://vega.github.io/vega-lite/docs/axis.html}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @param characterWidth,orient,format,remove
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
axis_y <- function(vl, axisWidth=NULL, layer=NULL, offset=NULL, grid=NULL, labels=TRUE,
                   labelAngle=NULL, labelAlign=NULL, labelBaseline=NULL, labelMaxLength=25,
                   shortTimeLabels=NULL, subdivide=NULL, ticks=NULL, tickPadding=NULL,
                   tickSize=NULL, tickSizeMajor=NULL, tickSizeMinor=NULL, tickSizeEnd=NULL,
                   title="", titleOffset=NULL, titleMaxLength=NULL, characterWidth=6,
                   orient=NULL, format=NULL, remove=FALSE) {
  chnl <- "y"

  if (remove) {
    vl$x$encoding[[chnl]]$axis <- FALSE
  } else {
    if (!is.null(axisWidth))       vl$x$encoding[[chnl]]$axis$axisWidth <- axisWidth
    if (!is.null(layer))           vl$x$encoding[[chnl]]$axis$layer <- layer
    if (!is.null(offset))          vl$x$encoding[[chnl]]$axis$offset <- offset
    if (!is.null(grid))            vl$x$encoding[[chnl]]$axis$grid <- grid
    if (!is.null(labels))          vl$x$encoding[[chnl]]$axis$labels <- labels
    if (!is.null(labelAngle))      vl$x$encoding[[chnl]]$axis$labelAngle <- labelAngle
    if (!is.null(labelAlign))      vl$x$encoding[[chnl]]$axis$labelAlign <- labelAlign
    if (!is.null(labelBaseline))   vl$x$encoding[[chnl]]$axis$labelBaseline <- labelBaseline
    if (!is.null(labelMaxLength))  vl$x$encoding[[chnl]]$axis$labelMaxLength <- labelMaxLength
    if (!is.null(shortTimeLabels)) vl$x$encoding[[chnl]]$axis$shortTimeLabels <- shortTimeLabels
    if (!is.null(subdivide))       vl$x$encoding[[chnl]]$axis$subdivide <- subdivide
    if (!is.null(ticks))           vl$x$encoding[[chnl]]$axis$ticks <- ticks
    if (!is.null(tickPadding))     vl$x$encoding[[chnl]]$axis$tickPadding <- tickPadding
    if (!is.null(tickSize))        vl$x$encoding[[chnl]]$axis$tickSize <- tickSize
    if (!is.null(tickSizeMajor))   vl$x$encoding[[chnl]]$axis$tickSizeMajor <- tickSizeMajor
    if (!is.null(tickSizeMinor))   vl$x$encoding[[chnl]]$axis$tickSizeMinor <- tickSizeMinor
    if (!is.null(tickSizeEnd))     vl$x$encoding[[chnl]]$axis$tickSizeEnd <- tickSizeEnd
    if (!is.null(title))           vl$x$encoding[[chnl]]$axis$title <- title
    if (!is.null(titleOffset))     vl$x$encoding[[chnl]]$axis$titleOffset <- titleOffset
    if (!is.null(titleMaxLength))  vl$x$encoding[[chnl]]$axis$titleMaxLength <- titleMaxLength
    if (!is.null(characterWidth))  vl$x$encoding[[chnl]]$axis$characterWidth <- characterWidth
    if (!is.null(orient))          vl$x$encoding[[chnl]]$axis$orient <- orient
    if (!is.null(format))          vl$x$encoding[[chnl]]$axis$format <- format
  }

  vl

}

#' General axis setttings (column facet)
#'
#' Axes provide axis lines, ticks and labels to convey how a spatial range represents
#' a data range. Simply put, axes visualize scales. \cr
#' \cr
#' By default, Vega-Lite automatically creates axes for x, y, row, and column channels
#' when they are encoded. Axis can be customized via the axis property of a channel
#' definition.
#'
#' @param vl Vega-Lite object
#' @param axisWidth,layer,offset,grid,labels,labelAngle,labelAlign,labelBaseline
#'        see \href{http://vega.github.io/vega-lite/docs/axis.html}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @param labelMaxLength,shortTimeLabels,subdivide,ticks,tickPadding,tickSize
#'        see \href{http://vega.github.io/vega-lite/docs/axis.html}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @param tickSizeMajor,tickSizeMinor,tickSizeEnd,title,titleOffset,titleMaxLength
#'        see \href{http://vega.github.io/vega-lite/docs/axis.html}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @param characterWidth,orient,format,remove
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
axis_facet_col <- function(vl, axisWidth=0, layer=NULL, offset=NULL, grid=FALSE, labels=TRUE,
                           labelAngle=NULL, labelAlign=NULL, labelBaseline=NULL, labelMaxLength=25,
                           shortTimeLabels=NULL, subdivide=NULL, ticks=NULL, tickPadding=NULL,
                           tickSize=0, tickSizeMajor=NULL, tickSizeMinor=NULL, tickSizeEnd=NULL,
                           title="", titleOffset=NULL, titleMaxLength=NULL, characterWidth=6,
                           orient=NULL, format=NULL, remove=FALSE) {

  chnl <- "column"
  if (!is.null(axisWidth))       vl$x$encoding[[chnl]]$axis$axisWidth <- axisWidth
  if (!is.null(layer))           vl$x$encoding[[chnl]]$axis$layer <- layer
  if (!is.null(offset))          vl$x$encoding[[chnl]]$axis$offset <- offset
  if (!is.null(grid))            vl$x$encoding[[chnl]]$axis$grid <- grid
  if (!is.null(labels))          vl$x$encoding[[chnl]]$axis$labels <- labels
  if (!is.null(labelAngle))      vl$x$encoding[[chnl]]$axis$labelAngle <- labelAngle
  if (!is.null(labelAlign))      vl$x$encoding[[chnl]]$axis$labelAlign <- labelAlign
  if (!is.null(labelBaseline))   vl$x$encoding[[chnl]]$axis$labelBaseline <- labelBaseline
  if (!is.null(labelMaxLength))  vl$x$encoding[[chnl]]$axis$labelMaxLength <- labelMaxLength
  if (!is.null(shortTimeLabels)) vl$x$encoding[[chnl]]$axis$shortTimeLabels <- shortTimeLabels
  if (!is.null(subdivide))       vl$x$encoding[[chnl]]$axis$subdivide <- subdivide
  if (!is.null(ticks))           vl$x$encoding[[chnl]]$axis$ticks <- ticks
  if (!is.null(tickPadding))     vl$x$encoding[[chnl]]$axis$tickPadding <- tickPadding
  if (!is.null(tickSize))        vl$x$encoding[[chnl]]$axis$tickSize <- tickSize
  if (!is.null(tickSizeMajor))   vl$x$encoding[[chnl]]$axis$tickSizeMajor <- tickSizeMajor
  if (!is.null(tickSizeMinor))   vl$x$encoding[[chnl]]$axis$tickSizeMinor <- tickSizeMinor
  if (!is.null(tickSizeEnd))     vl$x$encoding[[chnl]]$axis$tickSizeEnd <- tickSizeEnd
  if (!is.null(title))           vl$x$encoding[[chnl]]$axis$title <- title
  if (!is.null(titleOffset))     vl$x$encoding[[chnl]]$axis$titleOffset <- titleOffset
  if (!is.null(titleMaxLength))  vl$x$encoding[[chnl]]$axis$titleMaxLength <- titleMaxLength
  if (!is.null(characterWidth))  vl$x$encoding[[chnl]]$axis$characterWidth <- characterWidth
  if (!is.null(orient))          vl$x$encoding[[chnl]]$axis$orient <- orient
  if (!is.null(format))          vl$x$encoding[[chnl]]$axis$format <- format
  vl

}


#' General axis setttings (row facets)
#'
#' Axes provide axis lines, ticks and labels to convey how a spatial range represents
#' a data range. Simply put, axes visualize scales. \cr
#' \cr
#' By default, Vega-Lite automatically creates axes for x, y, row, and column channels
#' when they are encoded. Axis can be customized via the axis property of a channel
#' definition.
#'
#' @param vl Vega-Lite object
#' @param axisWidth,layer,offset,grid,labels,labelAngle,labelAlign,labelBaseline
#'        see \href{http://vega.github.io/vega-lite/docs/axis.html}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @param labelMaxLength,shortTimeLabels,subdivide,ticks,tickPadding,tickSize
#'        see \href{http://vega.github.io/vega-lite/docs/axis.html}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @param tickSizeMajor,tickSizeMinor,tickSizeEnd,title,titleOffset,titleMaxLength
#'        see \href{http://vega.github.io/vega-lite/docs/axis.html}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @param characterWidth,orient,format,remove
#'        see \href{http://vega.github.io/vega-lite/docs/axis.html}{axis docs} &
#'        \href{https://github.com/vega/vega-lite/blob/master/src/axis.ts}{axis base config}
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/axis.html}{Vega-List Axis spec}
#' @export
axis_facet_row <- function(vl, axisWidth=0, layer=NULL, offset=NULL, grid=FALSE, labels=TRUE,
                           labelAngle=NULL, labelAlign=NULL, labelBaseline=NULL, labelMaxLength=25,
                           shortTimeLabels=NULL, subdivide=NULL, ticks=NULL, tickPadding=NULL,
                           tickSize=0, tickSizeMajor=NULL, tickSizeMinor=NULL, tickSizeEnd=NULL,
                           title="", titleOffset=NULL, titleMaxLength=NULL, characterWidth=6,
                           orient=NULL, format=NULL, remove=FALSE) {
  chnl <- "row"
  if (!is.null(axisWidth))       vl$x$encoding[[chnl]]$axis$axisWidth <- axisWidth
  if (!is.null(layer))           vl$x$encoding[[chnl]]$axis$layer <- layer
  if (!is.null(offset))          vl$x$encoding[[chnl]]$axis$offset <- offset
  if (!is.null(grid))            vl$x$encoding[[chnl]]$axis$grid <- grid
  if (!is.null(labels))          vl$x$encoding[[chnl]]$axis$labels <- labels
  if (!is.null(labelAngle))      vl$x$encoding[[chnl]]$axis$labelAngle <- labelAngle
  if (!is.null(labelAlign))      vl$x$encoding[[chnl]]$axis$labelAlign <- labelAlign
  if (!is.null(labelBaseline))   vl$x$encoding[[chnl]]$axis$labelBaseline <- labelBaseline
  if (!is.null(labelMaxLength))  vl$x$encoding[[chnl]]$axis$labelMaxLength <- labelMaxLength
  if (!is.null(shortTimeLabels)) vl$x$encoding[[chnl]]$axis$shortTimeLabels <- shortTimeLabels
  if (!is.null(subdivide))       vl$x$encoding[[chnl]]$axis$subdivide <- subdivide
  if (!is.null(ticks))           vl$x$encoding[[chnl]]$axis$ticks <- ticks
  if (!is.null(tickPadding))     vl$x$encoding[[chnl]]$axis$tickPadding <- tickPadding
  if (!is.null(tickSize))        vl$x$encoding[[chnl]]$axis$tickSize <- tickSize
  if (!is.null(tickSizeMajor))   vl$x$encoding[[chnl]]$axis$tickSizeMajor <- tickSizeMajor
  if (!is.null(tickSizeMinor))   vl$x$encoding[[chnl]]$axis$tickSizeMinor <- tickSizeMinor
  if (!is.null(tickSizeEnd))     vl$x$encoding[[chnl]]$axis$tickSizeEnd <- tickSizeEnd
  if (!is.null(title))           vl$x$encoding[[chnl]]$axis$title <- title
  if (!is.null(titleOffset))     vl$x$encoding[[chnl]]$axis$titleOffset <- titleOffset
  if (!is.null(titleMaxLength))  vl$x$encoding[[chnl]]$axis$titleMaxLength <- titleMaxLength
  if (!is.null(characterWidth))  vl$x$encoding[[chnl]]$axis$characterWidth <- characterWidth
  if (!is.null(orient))          vl$x$encoding[[chnl]]$axis$orient <- orient
  if (!is.null(format))          vl$x$encoding[[chnl]]$axis$format <- format
  vl

}
