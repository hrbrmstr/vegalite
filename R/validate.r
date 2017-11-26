#' validate_vl
#'
#' Validate the Vega-Lite widget against the schema
#' @md
#' @param vl Vega-Lite object
#' @param message if invalid, print message?
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
validate_vl <- function(vl, message = TRUE){

  if (!requireNamespace("V8")) {
    stop("V8 package required for validate_vl function.\n",
         "Please install V8 and try again.")
  }

  spec <- vl$x
  spec$embed <- NULL
  schemafile <- system.file('htmlwidgets',
                            'lib',
                            'vega-lite',
                            'vega-lite-schema.json',
                            package = 'vegalite')
  vlschema <- jsonlite::read_json(schemafile)

  # V8
  ct <- V8::v8()
  zschema_js <- system.file('htmlwidgets',
                            'lib',
                            'z-schema',
                            'ZSchema-browser-min.js',
                            package = 'vegalite')
  ct$source(zschema_js)
  ct$eval("var validator = new ZSchema();")
  ct$eval("var errors")
  valid <- ct$call("validator.validate",spec,vlschema)

  if (!valid) {
    if (message) {
      err <- ct$call("validator.getLastErrors")
      message(err)
    }
    return(FALSE)
  } else {
    return(TRUE)
  }
}