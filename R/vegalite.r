#' @export
ggvega <- function(spec) {

  update_geom_defaults("point", list(shape=21, colour="steelblue", stroke=1))
  update_geom_defaults("bar", list(width=0.5, fill="steelblue"))

  spec <- fromJSON(spec)

  if (!is.null(spec[["data"]][["url"]])) {
    ext <- file_ext(spec$data$url)
    if (ext == "json") {
      spec$data$values <- fromJSON(spec$data$url)
    } else if (ext == "csv") {
      spec$data$values <- read.csv(spec$data$url, stringsAsFactors=FALSE)
    } else if (ext == "tsv") {
      spec$data$values <- read.csv(spec$data$url, sep="\t", stringsAsFactors=FALSE)
    }
  }

  if (is.null(spec[["encoding"]][["x"]][["field"]])) {
    spec$data$values$x <- 1
    spec$encoding$x <- list(field="x", type="nominal")
  }

  if (is.null(spec[["encoding"]][["y"]][["field"]])) {
    spec$data$values$y <- 1
    spec$encoding$y <- list(field="y", type="nominal")
  }

  gg <- ggplot(data=spec$data$values)

  gg <- gg + aes_string(x=spec$encoding$x$field,
                        y=spec$encoding$y$field)

  if (!is.null(spec[["encoding"]][["size"]])) {

    gg <- gg + aes_string(size=spec$encoding$size$field)

    if (spec$encoding$size$type == "quantitative") {
      gg <- gg + scale_size_continuous()
    } else if (spec$encoding$size$type == "nominal") {
      gg <- gg + scale_size_discrete()
    }

  } else {
    gg <- gg + scale_size_manual(values=1)
  }

  if (!is.null(spec[["encoding"]][["color"]])) {

    gg <- gg + aes_string(color=spec$encoding$color$field)

    if (spec$encoding$color$type == "quantitative") {
      gg <- gg + scale_color_continuous()
    } else if (spec$encoding$color$type == "nominal") {
      gg <- gg + scale_color_discrete()
    }

  }

  if (!is.null(spec[["encoding"]][["shape"]])) {

    gg <- gg + aes_string(shape=spec$encoding$shape$field)

    if (spec$encoding$shape$type == "quantitative") {
      gg <- gg + scale_shape_continuous()
    } else if (spec$encoding$shape$type == "nominal") {
      gg <- gg + scale_shape_discrete()
    }

  }

  if (spec$mark %in% c("point", "circle", "square")) {
    if (spec$mark == "circle") {
      update_geom_defaults("point", list(shape=16))
    } else if (spec$mark == "square") {
      update_geom_defaults("point", list(shape=15))
    }
    gg <- gg + geom_point()
  } else if (spec$mark == "bar") {
    gg <- gg + geom_bar(fill=color)
  }

  if (spec$encoding$x$type == "nominal") {
    gg <- gg + scale_x_discrete()
  } else if (spec$encoding$x$type == "quantitative") {
    gg <- gg + scale_x_continuous()
  }

  if (spec$encoding$y$type == "nominal") {
    gg <- gg + scale_y_discrete()
  } else if (spec$encoding$y$type == "quantitative") {
    gg <- gg + scale_y_continuous()
  }

  gg <- gg + theme_bw()

  gg

}
