#' Capture a static (png) version of a widget (e.g. for use in a PDF knitr document)
#'
#' Widgets are generally interactive beasts rendered in an HTML DOM with
#' javascript. That makes them unusable in PDF documents. However, many widgets
#' initial views would work well as static images. This function renders a widget
#' to a file and make it usable in a number of contexts.
#'
#' What is returned depends on the value of \code{output}. By default (\code{"path"}),
#' the full disk path will be returned. If \code{markdown} is specified, a markdown
#' string will be returned with a \code{file:///...} URL. If \code{html} is
#' specified, an \code{<img src='file:///...'/>} tag will be returned and if
#' \code{inline} is specified, a base64 encoded \code{<img>} tag will be returned
#' (just like you'd see in a self-contained HTML file from \code{knitr}).
#'
#' @importFrom webshot webshot
#' @importFrom base64 img
#' @param wdgt htmlwidget to capture
#' @param output how to return the results of the capture (see Details section)
#' @param height,width it's important for many widget to be responsive in HTML
#'        documents. PDFs are static beasts and having a fixed image size works
#'        better for them. \code{height} & \code{width} will be passed into the
#'        rendering process, which means you should probably specify similar
#'        values in your widget creation process so the captured \code{<div>}
#'        size matches the size you specify here.
#' @param png_render_path by default, this will be a temporary file location but
#'        a fully qualified filename (with extension) can be specified. It's up to
#'        the caller to free the storage when finished with the resource.
#' @return See Details
#' @export
#' @examples \dontrun{
#' library(webshot)
#' library(vegalite)
#'
#' dat <- jsonlite::fromJSON('[
#'       {"a": "A","b": 28}, {"a": "B","b": 55}, {"a": "C","b": 43},
#'       {"a": "D","b": 91}, {"a": "E","b": 81}, {"a": "F","b": 53},
#'       {"a": "G","b": 19}, {"a": "H","b": 87}, {"a": "I","b": 52}
#'     ]')
#'
#' vegalite(viewport_width=350, viewport_height=250) %>%
#'   add_data(dat) %>%
#'   encode_x("a", "ordinal") %>%
#'   encode_y("b", "quantitative") %>%
#'   mark_bar() -> vl
#'
#' capture_widget(vl, "inline", 250, 350)
#' }
capture_widget <- function(wdgt,
                           output=c("path", "markdown", "html", "inline"),
                           height, width,
                           png_render_path=tempfile(fileext=".png")) {

  wdgt_html_tf <- tempfile(fileext=".html")

  htmlwidgets::saveWidget(vl, wdgt_html_tf)

  webshot::webshot(url=sprintf("file://%s", wdgt_html_tf),
                   selector="#htmlwidget_container",
                   file=wdgt_png_tf,
                   vwidth=width, vheight=height)

  # done with HTML
  unlink(wdgt_html_tf)

  switch(match.arg(output, c("path", "markdown", "html", "inline")),
             `path`=png_render_path,
         `markdown`=sprintf("![widget](file://%s)", png_render_path),
             `html`=sprintf("<img src='file://%s'/>", png_render_path),
           `inline`=base64::img(wdgt_png_tf))

}
