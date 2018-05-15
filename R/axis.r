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
#' @param domain,grid,maxExtent,minExtent,orient,offset,position,zindex
#'        see \href{https://vega.github.io/vega-lite/docs/axis.html#general}{axis docs}
#' @param format,labels,labelAngle,labelOverlap,labelPadding
#'        see \href{https://vega.github.io/vega-lite/docs/axis.html#labels}{axis docs}
#' @param ticks,tickCount,tickSize,values
#'        see \href{https://vega.github.io/vega-lite/docs/axis.html#ticks}{axis docs}
#' @param title,titleMaxLength,titlePadding
#'        see \href{https://vega.github.io/vega-lite/docs/axis.html#title}{axis docs}
#' @param remove
#'        see \href{http://vega.github.io/vega-lite/docs/axis.html}{axis docs}
#' @param ... deprecated arguments
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
#'   scale_x_ordinal_vl(range_step=8) %>%
#'   scale_color_nominal_vl(range=c("#EA98D2", "#659CCA")) %>%
#'   facet_col("age", "ordinal", padding=4) %>%
#'   axis_x(remove=TRUE) %>%
#'   axis_y(title="population", grid=FALSE) %>%
#'   view_config(stroke_width=0) %>%
#'   mark_bar()
#'

axis_vl <- function(vl, chnl = "x",
                    domain=NULL,grid=NULL,maxExtent=NULL,minExtent=NULL,
                    orient=NULL,offset=NULL,position=NULL,zindex=NULL,
                    format=NULL,labels=NULL,labelAngle=NULL,labelOverlap=NULL,
                    labelPadding=NULL,ticks=NULL,tickCount=NULL,tickSize=NULL,
                    values=NULL,title=NULL,titleMaxLength=NULL,titlePadding=NULL,
                    remove=FALSE, ...) {

  if (length(list(...)) > 0) {
    warning("Supplied arguments to axis_vl that are not supported by vegalite 2: ",
            paste(names(list(...)),collapse = ","),". ",
            "\nThose arguments will be ignored. See ?axis_vl for supported ",
            "arguments.")
  }

  if (remove) {
    vl$x$encoding[[chnl]]$axis <- NA
  } else {

    # General
    if (!is.null(domain))             vl$x$encoding[[chnl]]$axis$domain <- domain
    if (!is.null(grid))               vl$x$encoding[[chnl]]$axis$grid <- grid
    if (!is.null(maxExtent))          vl$x$encoding[[chnl]]$axis$maxExtent <- maxExtent
    if (!is.null(minExtent))          vl$x$encoding[[chnl]]$axis$minExtent <- minExtent
    if (!is.null(orient))             vl$x$encoding[[chnl]]$axis$orient <- orient
    if (!is.null(offset))             vl$x$encoding[[chnl]]$axis$offset <- offset
    if (!is.null(position))           vl$x$encoding[[chnl]]$axis$position <- position
    if (!is.null(zindex))             vl$x$encoding[[chnl]]$axis$zindex <- zindex

    #Labels
    if (!is.null(format))             vl$x$encoding[[chnl]]$axis$format <- format
    if (!is.null(labels))             vl$x$encoding[[chnl]]$axis$labels <- labels
    if (!is.null(labelAngle))         vl$x$encoding[[chnl]]$axis$labelAngle <- labelAngle
    if (!is.null(labelOverlap))       vl$x$encoding[[chnl]]$axis$labelOverlap <- labelOverlap
    if (!is.null(labelPadding))       vl$x$encoding[[chnl]]$axis$labelOverlap <- labelPadding

    #Ticks
    if (!is.null(ticks))              vl$x$encoding[[chnl]]$axis$ticks <- ticks
    if (!is.null(tickCount))          vl$x$encoding[[chnl]]$axis$tickCount <- tickCount
    if (!is.null(tickSize))           vl$x$encoding[[chnl]]$axis$tickSize <- tickSize
    if (!is.null(values))             vl$x$encoding[[chnl]]$axis$values <- values

    #Title
    if (!is.null(title))              vl$x$encoding[[chnl]]$axis$title <- title
    if (!is.null(titleMaxLength))     vl$x$encoding[[chnl]]$axis$titleMaxLength <- titleMaxLength
    if (!is.null(titlePadding))     vl$x$encoding[[chnl]]$axis$titlePadding <- titlePadding

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
#'   scale_x_ordinal_vl(range_step=8) %>%
#'   scale_color_nominal_vl(range=c("#EA98D2", "#659CCA")) %>%
#'   facet_col("age", "ordinal", padding=4) %>%
#'   axis_x(remove=TRUE) %>%
#'   axis_y(title="population", grid=FALSE) %>%
#'   view_config(stroke_width=0) %>%
#'   mark_bar()

axis_facet_col <- function(vl, ...) {
  warning("axis_facet_col not supported by vegalite 2")
  vl
}


#' @rdname axis_vl
#' @export
axis_facet_row <- function(vl, ...) {
  warning("axis_facet_row not supported by vegalite 2")
  vl
}
