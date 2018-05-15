#' validate_vl
#'
#' Validate the Vega-Lite widget against the schema
#' @md
#' @param vl Vega-Lite object
#' @param verbose `TRUE` or `FALSE` -- should error reason be added as "errors"
#' attribute in case of invalid schema
#'
#' @details Use of this function requires jsonvalidate package to be installed.
#'
#' @return `TRUE` if valid, `FALSE` if not
#' @export
#'
#' @examples
#' dat <- jsonlite::fromJSON('[
#'     {"a": "A","b": 28}, {"a": "B","b": 55}, {"a": "C","b": 43},
#'     {"a": "D","b": 91}, {"a": "E","b": 81}, {"a": "F","b": 53},
#'     {"a": "G","b": 19}, {"a": "H","b": 87}, {"a": "I","b": 52}
#'   ]')
#'
#' vl <- vegalite() %>%
#'   add_data(dat) %>%
#'   encode_x("a", "ordinal") %>%
#'   encode_y("b", "quantitative") %>%
#'   mark_bar()
#'
#' validate_vl(vl)
validate_vl <- function(vl, verbose = TRUE){

  if (!requireNamespace("jsonvalidate")) {
    stop("jsonvalidate required for validate_vl function.\n",
         "Please install jsonvalidate and try again.")
  }

  spec <- to_spec(vl)

  schemafile <- system.file('htmlwidgets',
                            'lib',
                            'vega-lite',
                            'vega-lite-schema.json',
                            package = 'vegalite')

  jsonvalidate::json_validate(spec, schemafile, verbose = verbose)

}