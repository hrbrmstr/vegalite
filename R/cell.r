#' view aesthetics
#'
#' At its core, a Vega-Lite specification describes a single plot. This function
#' works to format those views with all of the options avaiable under
#' \href{https://vega.github.io/vega-lite/docs/config.html#view-config}{config.view.*}
#' When a facet channel is added, the visualization is faceted into a trellis
#' plot, which contains multiple plots. Each plot in either a single plot or a
#' trellis plot is called a view. View configuration allows us to customize each
#' individual single plot and each plot in a trellis plot.
#'
#' @param vl Vega-Lite object
#' @param width,height width and height property of the view configuration determine
#'        the width of a visualization with a continuous x-scale and the height of
#'        a visualization with a continuous y-scale respectively. Visit the
#'        URL in the References section for more information.
#' @param clip \code{FALSE} by default, whether the view should be clipped.
#' @param fill fill color
#' @param fill_opacity \code{0.0}-\code{1.0}
#' @param stroke stroke color
#' @param stroke_opacity \code{0.0}-\code{1.0}
#' @param stroke_width stroke of the width in pixels
#' @param stroke_dash an array of alternating stroke, space lengths for creating
#'        dashed or dotted lines.
#' @param stroke_dash_offset the offset (in pixels) into which to begin drawing with the stroke dash array.
#' @encoding UTF-8
#' @references
#'   \href{http://vega.github.io/vega-lite/docs/config.html#view-config}{Vega-Lite view spec}
#' @export

view_config <- function(vl, width=200, height=200, clip=FALSE, fill=NULL,
                        fill_opacity=NULL,stroke=NULL, stroke_opacity=NULL,
                        stroke_width=NULL, stroke_dash=NULL,
                        stroke_dash_offset=NULL) {

  view <- list()

  if (!is.null(width))              view$width <- width
  if (!is.null(height))             view$height <- height
  if (!is.null(clip))               view$clip <- clip
  if (!is.null(fill))               view$fill <- fill
  if (!is.null(fill_opacity))       view$fillOpacity <- fill_opacity
  if (!is.null(stroke))             view$stroke <- stroke
  if (!is.null(stroke_opacity))     view$strokeOpacity <- stroke_opacity
  if (!is.null(stroke_width))       view$strokeWidth <- stroke_width
  if (!is.null(stroke_dash))        view$strokeDash <- stroke_dash
  if (!is.null(stroke_dash_offset)) view$strokeDashOffset <- stroke_dash_offset

  vl$x$config$view <- view

  vl

}

#' @rdname deprecated-cell
#' @export
cell_config <- function(vl,...){
  .Deprecated("view_config",
              msg = "cell_config is deprecated; use view_config instead")
  view_config(vl, ...)
}

#' @rdname view_config
#' @export
#' @examples
#' vegalite() %>%
#'   view_size(300, 200) %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json") %>%
#'   encode_x("date", "temporal") %>%
#'   encode_y("count", "quantitative", aggregate="sum") %>%
#'   encode_color("series", "nominal") %>%
#'   scale_color_nominal(range="category20b") %>%
#'   timeunit_x("yearmonth") %>%
#'   scale_x_time(nice="month") %>%
#'   axis_x(axisWidth=0, format="%Y", labelAngle=0) %>%
#'   mark_area()
view_size <- function(vl, width=200, height=200) {
  vl <- view_config(vl, width=width, height=height)
  vl
}

#' @rdname deprecated-cell
#' @export
cell_size <- function(vl, width = 200, height = 200, facet = FALSE){
  .Deprecated("view_size",
              msg = "cell_size is deprecated; use view_size instead")
  view_size(vl, width = 200, height = 200)
}

#' @rdname deprecated-cell
#' @export
facet_cell <- function(vl, ...) {
  .Deprecated("view_config",
              msg = "facet_cell is deprecated; use view_config instead")
  vl <- view_config(vl, ...)
  vl
}

#' Deprecated `cell` functions
#'
#' Vega-lite 2 no longer has `cell` and `facet` properties under `config`.  Thus
#' functions setting those properties have been deprecated. Some of the
#' functionality can be acheived with \code{\link{view_config}} and
#' \code{\link{view_size}}.
#'
#' @md
#' @param vl Vega-Lite object
#' @param grid_color color of the grid between facets.
#' @param grid_opacity \code{0.0}-\code{1.0}
#' @param grid_offset offset for grid between facets.
#' @encoding UTF-8
#' @rdname deprecated-cell
#' @references
#'   \href{http://vega.github.io/vega-lite/docs/config.html}{Vega-Lite 2 config spec}
#'   \href{http://vega.github.io/vega-lite-v1/docs/config.html#cell-config}{Vega-Lite 1 cell spec}
#'   \href{http://vega.github.io/vega-lite-v1/docs/config.html#facet-config}{Vega-Lite 1 cell spec}
#' @export
grid_facet <- function(vl, grid_color=NULL, grid_opacity=NULL, grid_offset=NULL) {

  .Deprecated("view_config",
              msg = paste0("grid_facet is deprecated, calling it will have no ",
                           "effect"))
  vl

}

