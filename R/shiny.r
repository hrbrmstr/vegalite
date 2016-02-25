
#' Widget output function for use in Shiny
#'
#' @export
vegaliteOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'vegalite', width, height, package = 'vegalite')
}

#' Widget render function for use in Shiny
#'
#' @export
renderVegalite <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, vegaliteOutput, env, quoted = TRUE)
}
