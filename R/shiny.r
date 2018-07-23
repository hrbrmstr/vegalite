#' Widget output function for use in Shiny
#'
#' @param outputId widget output id
#' @param width,height widget height/width
#' @export
vegaliteOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'vegalite', width, height, package = 'vegalite')
}

#' Widget render function for use in Shiny
#'
#' @param expr expr to render
#' @param env evaluation environemnt
#' @param quoted quote expression?
#' @export
renderVegalite <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, vegaliteOutput, env, quoted = TRUE)
}

#' @rdname vegaliteOutput
#' @export
vegaliteSpecOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, name = "spec", width, height, package = "vegalite")
}

#' @rdname renderVegalite
#' @export
renderVegaliteSpec <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr <- substitute(expr)
  }
  htmlwidgets::shinyRenderWidget(expr, vegaliteSpecOutput, env, quoted = TRUE)
}