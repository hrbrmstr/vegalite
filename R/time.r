#' How to encode x-axis time values
#'
#' @param vl Vega-Lite object
#' @param unit the property of a channel definition sets the level of specificity
#'        for a temporal field. Currently supported values are 'year', 'yearmonth',
#'        'yearmonthday', 'yearmonthdate', 'yearday', 'yeardate', 'yearmonthdayhours'
#'        and 'yearmonthdayhoursminutes' for non-periodic time units & 'month',
#'        'day', 'date', 'hours', 'minutes', 'seconds', 'milliseconds', 'hoursminutes',
#'        'hoursminutesseconds', 'minutesseconds' and 'secondsmilliseconds' for
#'        periodic time units.
#' @references \href{http://vega.github.io/vega-lite/docs/timeunit.html}{Vega-Lite Time Unit}
#' @export
timeunit_x <- function(vl, unit) {
  vl$x$encoding$x$timeUnit <- unit
  vl
}

#' How to encode y-axis time values
#'
#' @param vl Vega-Lite object
#' @param unit the property of a channel definition sets the level of specificity
#'        for a temporal field. Currently supported values are 'year', 'yearmonth',
#'        'yearmonthday', 'yearmonthdate', 'yearday', 'yeardate', 'yearmonthdayhours'
#'        and 'yearmonthdayhoursminutes' for non-periodic time units & 'month',
#'        'day', 'date', 'hours', 'minutes', 'seconds', 'milliseconds', 'hoursminutes',
#'        'hoursminutesseconds', 'minutesseconds' and 'secondsmilliseconds' for
#'        periodic time units.
#' @references \href{http://vega.github.io/vega-lite/docs/timeunit.html}{Vega-Lite Time Unit}
#' @export
timeunit_y <- function(vl, unit) {
  vl$x$encoding$y$timeUnit <- unit
  vl
}
