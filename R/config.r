#' Opacity config
#'
#' @param vl a Vega-Lite object
#' @param opacity \code{0.0}-\code{1.0}
#' @param fill_opacity \code{0.0}-\code{1.0}
#' @param stroke_opacity \code{0.0}-\code{1.0}
#' @encoding UTF-8
#' @export
config_opacity <- function(vl, opacity=NULL, fill_opacity=NULL, stroke_opacity=NULL) {
  if (!is.null(opacity))        vl$x$config$mark$opacity <- opacity
  if (!is.null(fill_opacity))   vl$x$config$mark$fillOpacity <- fill_opacity
  if (!is.null(stroke_opacity)) vl$x$config$mark$strokeOpacity <- stroke_opacity
  vl
}

#' Stroke config
#'
#' @param vl a Vega-Lite object
#' @param stroke stroke color
#' @param stroke_opacity \code{0.0}-\code{1.0}
#' @param stroke_width stroke of the width in pixels
#' @param stroke_dash an array of alternating stroke, space lengths for creating
#'        dashed or dotted lines.
#' @param stroke_dash_offset the offset (in pixels) into which to begin drawing with the stroke dash array.
#' @encoding UTF-8
#' @export
config_stroke <- function(vl, stroke=NULL, stroke_width=NULL,
                          stroke_dash=NULL, stroke_dash_offset=NULL,
                          stroke_opacity=NULL) {
  if (!is.null(stroke))             vl$x$config$mark$stroke <- stroke
  if (!is.null(stroke_width))       vl$x$config$mark$strokeWidth <- stroke_width
  if (!is.null(stroke_dash))        vl$x$config$mark$strokeEash <- stroke_dash
  if (!is.null(stroke_dash_offset)) vl$x$config$mark$strokeDashOffset <- stroke_dash_offset
  if (!is.null(stroke_opacity)) vl$x$config$mark$strokeOpacity <- stroke_opacity
  vl
}

#' Color config
#'
#' @param vl a Vega-Lite object
#' @param color  color of the mark – either fill or stroke color based on the filled mark config.
#' @param fill fill color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is true.
#' @param stroke stroke color. This config will be overridden by color channel’s
#'        specified or mapped values if filled is false.
#' @encoding UTF-8
#' @export
config_color <- function(vl, color=NULL, fill=NULL, stroke=NULL) {
  if (!is.null(color)) vl$x$config$mark$color <- color
  if (!is.null(fill))  vl$x$config$mark$fill <- fill
  vl
}

#' Text config
#'
#' @param vl a Vega-Lite object
#' @param angle rotation angle of the text, in degrees.
#' @param align horizontal alignment of the text. One of left, right, center.
#' @param baseline vertical alignment of the text. One of top, middle, bottom.
#' @param dx,dy horizontal/vertical in pixels, between the text label and its
#'        anchor point. The offset is applied after rotation by the angle property.
#' @param radius polar coordinate radial offset, in pixels, of the text label
#'        from the origin determined by the x and y properties.
#' @param theta polar coordinate angle, in radians, of the text label from the
#'        origin determined by the x and y properties. Values for theta follow
#'        the same convention of arc mark startAngle and endAngle properties:
#'        angles are measured in radians, with 0 indicating “north”.
#' @param format ormatting pattern for text value. If not defined, this will be
#'        determined automatically
#' @param short_time_labels whether month names and weekday names should be abbreviated.
#' @param opacity 0-1
#' @encoding UTF-8
#' @references \href{http://vega.github.io/vega-lite/docs/mark.html}{Vega-Lite Mark spec}
#' @export
config_text <- function(vl, angle=NULL, align=NULL, baseline=NULL,
                      dx=NULL, dy=NULL, radius=NULL, theta=NULL,
                      format=NULL, short_time_labels=NULL, opacity=NULL) {

  if (!is.null(angle))             vl$x$config$mark$angle <- angle
  if (!is.null(align))             vl$x$config$mark$align <- align
  if (!is.null(baseline))          vl$x$config$mark$baseline <- baseline
  if (!is.null(dx))                vl$x$config$mark$dx <- dx
  if (!is.null(dy))                vl$x$config$mark$dy <- dy
  if (!is.null(radius))            vl$x$config$mark$radius <- radius
  if (!is.null(theta))             vl$x$config$mark$theta <- theta
  if (!is.null(format))            vl$x$config$mark$format <- format
  if (!is.null(short_time_labels)) vl$x$config$mark$shortTimeLabels <- short_time_labels
  if (!is.null(opacity))           vl$x$config$mark$opacity <- opacity
  return(vl)

}

#' Font config
#'
#' @param vl a Vega-Lite object
#' @param font typeface to set the text in (e.g., Helvetica Neue).
#' @param font_size font size, in pixels. The default value is 10.
#' @param font_style font style (e.g., italic).
#' @param font_weight font weight (e.g., bold).
#' @encoding UTF-8
#' @export
config_font <- function(vl, font=NULL, font_size=NULL, font_style=NULL, font_weight=NULL) {
  if (!is.null(font))        vl$x$config$mark$font <- font
  if (!is.null(font_size))   vl$x$config$mark$fontSize <- font_size
  if (!is.null(font_style))  vl$x$config$mark$fontStyle <- font_style
  if (!is.null(font_weight)) vl$x$config$mark$fontWight <- font_weight
  vl
}

