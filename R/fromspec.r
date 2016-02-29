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
#' @encoding UTF-8
#' @export
#' @examples
#' from_spec("http://rud.is/dl/embedded.json")
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
#' @param vl a Vega-Lite object
#' @param pretty if \code{TRUE} (default) then a "pretty-printed" version of the spec
#'        will be returned. Use \code{FALSE} for a more compact version.
#' @param to_cb if \code{TRUE}, will copy the spec to the system clipboard. Default is \code{FALSE}.
#' @return JSON spec
#' @importFrom clipr write_clip
#' @export
#' @encoding UTF-8
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
to_spec <- function(vl, pretty=TRUE, to_cb=FALSE) {
  tmp <- jsonlite::toJSON(vl$x, pretty=pretty, auto_unbox=TRUE)
  if (to_cb) clipr::write_clip(tmp)
  tmp
}

#' Scaffold HTML/JavaScript/CSS code from \code{vegalite}
#'
#' Create minimal necessary HTML/JavaScript/CSS code to embed a
#' Vega-Lite spec into a web page. This assumes you have the necessary
#' boilerplate javascript & HTML page shell defined as you see in
#' \href{http://vega.github.io/vega-lite/tutorials/getting_started.html#embed}{the Vega-Lite core example}.
#'
#' If you are generating more than one object to embed into a single web page,
#' you will need to ensure each \code{element_id} is unique. Each Vega-Lite
#' \code{div} is classed with \code{vldiv} so you can provide both a central style
#' (say, \code{display:inline-block; margin-auto;}) and targeted ones that use the
#' \code{div} \code{id}.
#'
#' @param vl a Vega-Lite object
#' @param element_id if you don't specify one, an id will be generated. This should
#'        be descriptive, but short, and valid javascript & CSS identifier syntax as
#'        is is appended to variable names.
#' @param to_cb if \code{TRUE}, will copy the spec to the system clipboard. Default is \code{FALSE}.
#' @encoding UTF-8
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
#' embed_spec(chart)
embed_spec <- function(vl, element_id=generate_id(), to_cb=FALSE) {

  template <- '<center><div id="%s" class="vldiv"></div></center>

<script>
var spec_%s = JSON.parse(\'%s\');

var embedSpec_%s = { "mode": "vega-lite", "spec": spec_%s, "renderer": spec_%s.embed.renderer, "actions": spec_%s.embed.actions };

vg.embed("#%s", embedSpec_%s, function(error, result) {});
</script>'

  tmp <- sprintf(template,
          element_id, element_id, to_spec(vl, pretty=FALSE),
          element_id, element_id, element_id, element_id, element_id, element_id)

  if (to_cb) clipr::write_clip(tmp)

  tmp

}

#' @importFrom digest sha1
generate_id <- function() {
  sprintf("vl%s", substr(digest::sha1(Sys.time()), 1, 8))
}
