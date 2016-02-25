#' Create and (optionally) visualize a Vega-Lite spec
#'
#' @param description a single element character vector that provides a description of
#'        the plot/spec.
#' @param viewport_widgth,viewport_height height and width of the overall
#'        visualziation viewport. This is the overall area reserved for the
#'        plot. You can leave these \code{NULL} and use \code{\link{cell_size}}
#'        instead but you will want to configure both when making faceted plots.
#' @param background plot background color. If \code{NULL} the background will be transparent.
#' @param time_format the default time format pattern for text and labels of
#'        axes and legends (in the form of \href{https://github.com/mbostock/d3/wiki/Time-Formatting}{D3 time format pattern}).
#'        Default: \code{\%Y-\%m-\%d}
#' @param number_format the default number format pattern for text and labels of
#'        axes and legends (in the form of
#'        \href{https://github.com/mbostock/d3/wiki/Formatting}{D3 number format pattern}).
#'        Default: \code{s}
#' @references \href{http://vega.github.io/vega-lite/docs/config.html#top-level-config}{Vega-Lite top-level config}
#' @export
vegalite <- function(description="", viewport_width=NULL, viewport_height=NULL,
                     background=NULL, time_format=NULL, number_format=NULL) {

  # forward options using x
  params <- list(
    description = description,
    data = list(),
    mark = list(),
    encoding = list(),
    config = list()
  )

  if (!is.null(viewport_width) & !is.null(viewport_height)) {
    params$config$viewport <- c(viewport_width, viewport_height)
  }
  if (!is.null(background)) { params$config$background <- background }
  if (!is.null(time_format)) { params$config$timeFormat <- time_format }
  if (!is.null(number_format)) { params$config$numberFormat <- number_format }

  # create widget
  htmlwidgets::createWidget(
    name = 'vegalite',
    x = params,
    width = viewport_width,
    height = viewport_height,
    package = 'vegalite'
  )

}
