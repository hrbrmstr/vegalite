`vegalite` : Do whatever `ggvis` doesn't :-)

For better examples, [take a look here](http://rud.is/projects/vegalite01.html).

### Current Status

This is ~90% feature complete to building Vega-Lite specs from piped R function calls. Many of the functions have extensive help. This is still a work in progress :-)

### Dev notes

#### For `ggvega`

Current thinking is to try to use the `vega-lite` node module "headless" and let it do the transforms (et al) then get the spec back into R and convert to ggplot2.

It turns out that thinking is semi-ok. `vega-lite` will compile to a full Vega spec, but it relies on `vega` to do all the heavy lifting. That's a binary install on most systems.

So, I have to write a parser for the Vega expression language. ugh.

### Installation


```r
devtools::install_github("hrbrmstr/vegalite")
```



### Usage


```r
library(vegalite)

# current verison
packageVersion("vegalite")
```

```
## [1] '0.1.0'
```


```r
library(vegalite)

vegalite() %>% 
  cell_size(400, 400) %>% 
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>% 
  encode_x("Horsepower") %>% 
  encode_y("Miles_per_Gallon") %>% 
  encode_color("Origin", "nominal") %>% 
  mark_point()
```

![](vega.png)

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

