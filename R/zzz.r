.pkgenv <- new.env(parent=emptyenv())

.onAttach <- function(...) {

  ct <- v8()
  ct$source(system.file("js/vegalite-bundle.js", package="vegalite"))
  assign("ct", ct, envir=.pkgenv)

  if (!interactive()) return()

  packageStartupMessage(paste0("vegalite is under *active* development. ",
                               "See https://github.com/hrbrmstr/vegalite for changes"))

}