#' Create Vega-Lite specs using htmlwidget idioms
#'
#' Creation of Vega-Lite spec charts is 90\% feature complete. Sorting still
#' needs to be implementd and many of the parameters to functions are only
#' documented in TypeScript source code which will take a bit of time to
#' wade through. All the visualizations you find in the
#' \href{http://vega.github.io/vega-lite/gallery.html}{Vega-Lite Gallery} work
#' (but the last one just isn't sorted).
#'
#' Functions also exist which enable creation of widgets from a JSON spec and
#' turning a \code{vegalite} package created object into a JSON spec.
#'
#' @name vegalite
#' @docType package
#' @author Bob Rudis (@@hrbrmstr)
#' @importFrom jsonlite fromJSON toJSON
#' @export
NULL

#' vegalite exported operators
#'
#' The following functions are imported and then re-exported
#' from the vegalite package to enable use of the magrittr
#' pipe operator with no additional library calls.
#'
#' @name vegalite-exports
NULL

#' @importFrom magrittr %>%
#' @name %>%
#' @export
#' @rdname vegalite-exports
NULL

#' @importFrom htmlwidgets JS
#' @name JS
#' @export
#' @rdname vegalite-exports
NULL

#' @importFrom htmlwidgets saveWidget
#' @name saveWidget
#' @export
#' @rdname vegalite-exports
NULL