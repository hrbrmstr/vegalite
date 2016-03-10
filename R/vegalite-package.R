#' Create Vega-Lite specs using htmlwidget idioms
#'
#' Creation of Vega-Lite spec charts is virtually 100\% feature complete.
#' Some of the parameters to functions are only documented in TypeScript
#' source code which will take a bit of time to
#' wade through. All the visualizations you find in the
#' \href{http://vega.github.io/vega-lite/gallery.html}{Vega-Lite Gallery} work.
#' \cr
#' Functions also exist which enable creation of widgets from a JSON spec and
#' turning a \code{vegalite} package created object into a JSON spec.
#'
#' You start by calling \code{vegalite()} which allows you to setup core
#' configuration options, including whether you want to display links to
#' show the source and export the visualization. You can also set the background
#' here and the \code{viewport_width} and \code{viewport_height}. Those are
#' very important as they control the height and width of the widget and also
#' the overall area for the chart. This does \emph{not} set the height/width
#' of the actual chart. That is done with \code{cell_size()}.
#'
#' Once you instantiate the widget, you need to \code{add_data()} which can
#' be \code{data.frame}, local CSV, TSV or JSON file (that convert to
#' \code{data.frame}s) or a non-realive URL (wich will not be read and
#' converted but will remain a URL in the Vega-Lite spec.
#'
#' You then need to \code{encode_x()} & \code{encode_y()} variables that
#' map to columns in the data spec and choose one \code{mark_...()} to
#' represent the encoding.
#'
#' Here's a sample, basic Vega-Lite widget:
#'
#' \preformatted{
#'   dat <- jsonlite::fromJSON('[
#'       {"a": "A","b": 28}, {"a": "B","b": 55}, {"a": "C","b": 43},
#'       {"a": "D","b": 91}, {"a": "E","b": 81}, {"a": "F","b": 53},
#'       {"a": "G","b": 19}, {"a": "H","b": 87}, {"a": "I","b": 52}
#'     ]')
#'
#'   vegalite() %>%
#'     add_data(dat) %>%
#'     encode_x("a", "ordinal") %>%
#'     encode_y("b", "quantitative") %>%
#'     mark_bar() -> vl
#'
#'    vl
#'   }
#'
#' That is the minimum set of requirements for a basic Vega-Lite spec and
#' will create a basic widget.
#'
#' You can also convert that R widget object \code{to_spec()} which will return
#' the JSON for the Vega-Lite spec (allowing you to use it outside of R).
#'
#' \preformatted{
#'
#' to_spec(vl)
#'
#' {
#'   "description": "",
#'   "data": {
#'     "values": [
#'       { "a": "A", "b": 28 }, { "a": "B", "b": 55 }, { "a": "C", "b": 43 },
#'       { "a": "D", "b": 91 }, { "a": "E", "b": 81 }, { "a": "F", "b": 53 },
#'       { "a": "G", "b": 19 }, { "a": "H", "b": 87 }, { "a": "I", "b": 52 }
#'     ]
#'   },
#'   "mark": "bar",
#'   "encoding": {
#'     "x": {
#'       "field": "a",
#'       "type": "nominal"
#'     },
#'     "y": {
#'       "field": "b",
#'       "type": "quantitative"
#'     }
#'   },
#'   "config": [],
#'   "embed": {
#'     "renderer": "svg",
#'     "actions": {
#'       "export": false,
#'       "source": false,
#'       "editor": false
#'     }
#'   }
#' }
#'
#' }
#'
#' If you already have a Vega-Lite JSON spec that has embedded data or a
#' non-realtive URL, you can create a widget from it via \code{from_spec()}
#' by passing in the full JSON spec or a URL to a full JSON spec.
#'
#' If you're good with HTML (etc) and want a more lightweight embedding options, you
#' can also use \code{\link{embed_spec}} which will scaffold a minimum \code{div} +
#' \code{script} source and embed a spec from a \code{vegalite} object.
#'
#' If you like the way Vega-Lite renders charts, you can also use them as static
#' images in PDF knitted documents with the new \code{capture_widget} function.
#' (NOTE that as of this writing, you can just use the development version of
#' \code{knitr} instead of this function.)
#'
#' @name vegalite-package
#' @docType package
#' @author Bob Rudis (@@hrbrmstr)
NULL

#' @importFrom magrittr %>%
#' @export
magrittr::`%>%`

#' @name JS
#' @rdname JS
#' @title Mark character strings as literal JavaScript code
#' @description Mark character strings as literal JavaScript code
#' @export
NULL

#' @name saveWidget
#' @rdname saveWidget
#' @title Save a widget to an HTML file
#' @description Save a widget to an HTML file
#' @export
NULL