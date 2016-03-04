#' Add data to a Vega-Lite spec
#'
#' Vega-Lite is more lightweight than full Vega. However, the spec is
#' flexible enough to support embedded data or using external sources that
#' are in JSON, CSV or TSV format.
#'
#' @param vl a Vega-Lite object
#' @param source you can specify a (fully qualified) URL or an existing
#'        \code{data.frame} (or \code{ts}) object or a reference to a local file.
#'        For the URL case, the \code{url} component of \code{data} will be set. You can help
#'        Vega-Lite out by giving it a hint for the data type with \code{format_type}
#'        but it is not required. For the local \code{data.frame} case it will embed
#'        the data into the spec. For the case where a local file is specified, it
#'        will be read in (either a JSON file, CSV file or TSV file) and converted
#'        to a \code{data.frame} and embedded.
#' @param format_type if \code{source} is a URL, this should be one of \code{json},
#'        \code{csv} or \code{tsv}). It is not required and it is ignored if \code{source}
#'        is not a URL.
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/data.html}{Vega-Lite Data spec}
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
#'   mark_bar()
add_data <- function(vl, source, format_type=NULL) {

  if (inherits(source, "data.frame")) {

    vl$x$data$values <- data.frame(source, stringsAsFactors=FALSE)

  } else if (inherits(source, "ts")) {

    vl$x$data$values <- as.data.frame(source, stringsAsFactors=FALSE)

  } else if (is_url(source)) {

    vl$x$data <- list(url=source)
    if (!is.null(format_type)) vl$x$data$formatType <- format_type

  } else if (file.exists(source)) {

    ext <- tools::file_ext(source)

    if (ext == "json") {
      vl$x$data$values <- jsonlite::fromJSON(source, flatten=TRUE)
    } else if (ext == "csv") {
      vl$x$data$values <- read.csv(source, stringsAsFactors=FALSE)
    } else if (ext == "tsv") {
      vl$x$data$values <- read.csv(source, sep="\t", stringsAsFactors=FALSE)
    } else {
      stop('"source" is not a JSON, CSV or TSV file.', call.=FALSE)
    }

  } else {
    stop('"source" is not a data.frame, URL or local file.', call.=FALSE)
  }

  vl

}

is_url <- function(x) {
  pattern <- "^([abcdefghijklmnopqrstuvwxyz]+)(://.*)"
  (regexpr(pattern, x) != -1)
}
