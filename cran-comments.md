## Test environments
* local OS X install, R 3.2.4
* ubuntu 12.04 (local, not Travis, for visual tests), R 3.2.4
* win-builder (devel and release)
* Windows (local) for visual tests

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

## Reverse dependencies

This is a new release, so there are no reverse dependencies.

## Extra notes

I don't know why I keep writing
packages that rely on third-
party libraries with weird names
that requrie quotes in the 
DESCRIPTION file, but I do. If 
the spell check whines, please 
ignore. I've used the right 
representation wherever it was
needed.

Also, the vignette is big, but
having one central source for all
the examples was really helpful
in feedback from others. If you
folks want me to break it up 
into multiple vignettes I will,
but it'll just make the overall
package size bigger thanks to
the way knitr embeds the libs
into HTML documents :-)
