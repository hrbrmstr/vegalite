#' Take a JSON Vega-Lite Spec and render as an htmlwidget
#'
#' Vega-Lite is - at the core - a JSON "Grammar of Graphics" specification
#' for how to build a data- & stats-based visualization. While Vega & D3 are
#' the main targets, the use of Vega-Lite does not have to be restricted to just
#' D3. For now, this function takes in a JSON spec (full text or URL) and
#' renders it as an htmlwidget. Data should either be embedded or use a
#' an absolute URL reference.
#'
#' @param spec URL to a Vega-Lite JSON file or the JSON text of a spec
#' @param width,height widget width/height
#' @param renderer the renderer to use for the view. One of \code{canvas} or
#'        \code{svg} (the default)
#' @param export if \code{TRUE} the \emph{"Export as..."} link will
#'        be displayed with the chart.(Default: \code{FALSE}.)
#' @param source if \code{TRUE} the \emph{"View Source"} link will be displayed
#'        with the chart. (Default: \code{FALSE}.)
#' @param editor if \code{TRUE} the \emph{"Open in editor"} link will be
#'        displayed with the cahrt. (Default: \code{FALSE}.)
#' @export
#' @examples
#' from_spec("http://rud.is/dl/embedded.js")
from_spec <- function(spec, width=NULL, height=NULL,
                      renderer=c("svg", "canvas"),
                      export=FALSE, source=FALSE, editor=FALSE) {

  if (is_url(spec)) { spec <- readLines(spec, warn=FALSE) }

  spec <- paste0(spec, collapse="", sep="")

  # forward options using x
  params <- list(
    spec=spec,
    renderer=renderer[1],
    export=export,
    source=source,
    editor=editor
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'spec',
    x = params,
    width = width,
    height = height,
    package = 'vegalite'
  )

}

#' Convert a spec created with widget idioms to JSON
#'
#' Takes an htmlwidget object and turns it into a JSON Vega-Lite spec
#'
#' @note This won't work 100\% of the time yet. \code{calculate}d transforms
#'       need to be in an array and that requires going back and tagging
#'       all other single-element vectors with \code{unbox} which is just
#'       tedious and best saved for a rainy day.
#' @param vl a Vega-Lite object
#' @return JSON spec
#' @export
#' @examples
#' dat <- jsonlite::fromJSON('[
#'     {"a": "A","b": 28}, {"a": "B","b": 55}, {"a": "C","b": 43},
#'     {"a": "D","b": 91}, {"a": "E","b": 81}, {"a": "F","b": 53},
#'     {"a": "G","b": 19}, {"a": "H","b": 87}, {"a": "I","b": 52}
#'   ]')
#'
#' vegalite() %>%
#'   add_data(dat) %>%
#'   encode_x("a", "ordinal") %>%
#'   encode_y("b", "quantitative") %>%
#'   mark_bar() -> chart
#'
#' to_spec(chart)
to_spec <- function(vl) {
  jsonlite::toJSON(vl$x, pretty=TRUE, auto_unbox=TRUE)
}
