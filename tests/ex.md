# vegalite test
@hrbrmstr  
  


```r
#devtools::install_github("hrbrmstr/vegalite")
library(vegalite)
```

### bar mark


```r
dat <- jsonlite::fromJSON('[
      {"a": "A","b": 28}, {"a": "B","b": 55}, {"a": "C","b": 43},
      {"a": "D","b": 91}, {"a": "E","b": 81}, {"a": "F","b": 53},
      {"a": "G","b": 19}, {"a": "H","b": 87}, {"a": "I","b": 52}
    ]')

vegalite(viewport_height=250) %>%
  cell_size(400, 200) %>%
  add_data(dat) %>%
  encode_x("a", "ordinal") %>%
  encode_y("b", "quantitative") %>%
  mark_bar()
```

<!--html_preserve--><div id="htmlwidget-7915" style="width:672px;height:250px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-7915">{"x":{"description":"","data":{"values":{"a":["A","B","C","D","E","F","G","H","I"],"b":[28,55,43,91,81,53,19,87,52]}},"hasTransform":false,"transform":[],"mark":"bar","encoding":{"x":{"field":"a","type":"ordinal"},"y":{"field":"b","type":"quantitative"}},"config":{"cell":{"width":400,"height":200}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### point mark


```r
vegalite() %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-8591" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-8591">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"hasTransform":false,"transform":[],"mark":"point","encoding":{"x":{"field":"Horsepower","type":"quantitative"},"y":{"field":"Miles_per_Gallon","type":"quantitative"}},"config":{"cell":{"width":400,"height":400}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### cirlce mark


```r
vegalite() %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  mark_circle()
```

<!--html_preserve--><div id="htmlwidget-3372" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-3372">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"hasTransform":false,"transform":[],"mark":"circle","encoding":{"x":{"field":"Horsepower","type":"quantitative"},"y":{"field":"Miles_per_Gallon","type":"quantitative"}},"config":{"cell":{"width":400,"height":400}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### color and shape


```r
vegalite() %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  encode_color("Origin", "nominal") %>%
  encode_shape("Origin", "nominal") %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-9051" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-9051">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"hasTransform":false,"transform":[],"mark":"point","encoding":{"x":{"field":"Horsepower","type":"quantitative"},"y":{"field":"Miles_per_Gallon","type":"quantitative"},"color":{"field":"Origin","type":"nominal"},"shape":{"field":"Origin","type":"nominal"}},"config":{"cell":{"width":400,"height":400}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### size


```r
vegalite() %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  encode_size("Acceleration", "quantitative") %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-4844" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-4844">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"hasTransform":false,"transform":[],"mark":"point","encoding":{"x":{"field":"Horsepower","type":"quantitative"},"y":{"field":"Miles_per_Gallon","type":"quantitative"},"size":{"field":"Acceleration","type":"quantitative"}},"config":{"cell":{"width":400,"height":400}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### filtered line


```r
vegalite() %>%
  cell_size(400, 450) %>%
  add_data("https://vega.github.io/vega-editor/app/data/stocks.csv") %>%
  add_filter("datum.symbol==='GOOG'") %>%
  encode_x("date", "temporal") %>%
  encode_y("price", "quantitative") %>%
  mark_line()
```

<!--html_preserve--><div id="htmlwidget-2683" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-2683">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/stocks.csv"},"hasTransform":true,"transform":{"filter":"datum.symbol==='GOOG'"},"mark":"line","encoding":{"x":{"field":"date","type":"temporal"},"y":{"field":"price","type":"quantitative"}},"config":{"cell":{"width":400,"height":450}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### ticks


```r
vegalite(viewport_height=200) %>%
  cell_size(400, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Cylinders", "ordinal") %>%
  mark_tick()
```

<!--html_preserve--><div id="htmlwidget-8541" style="width:672px;height:200px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-8541">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"hasTransform":false,"transform":[],"mark":"tick","encoding":{"x":{"field":"Horsepower","type":"quantitative"},"y":{"field":"Cylinders","type":"ordinal"}},"config":{"cell":{"width":400,"height":200}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### multi-series line


```r
vegalite(viewport_height=500) %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/stocks.csv") %>%
  encode_x("date", "temporal") %>%
  encode_y("price", "quantitative") %>%
  encode_color("symbol", "nominal") %>%
  mark_line()
```

<!--html_preserve--><div id="htmlwidget-644" style="width:672px;height:500px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-644">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/stocks.csv"},"hasTransform":false,"transform":[],"mark":"line","encoding":{"x":{"field":"date","type":"temporal"},"y":{"field":"price","type":"quantitative"},"color":{"field":"symbol","type":"nominal"}},"config":{"cell":{"width":400,"height":400}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### facet col


```r
vegalite(viewport_height=350) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("Worldwide_Gross", "quantitative") %>%
  encode_y("US_DVD_Sales", "quantitative") %>%
  facet_col("MPAA_Rating", "ordinal") %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-7523" style="width:672px;height:350px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-7523">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/movies.json"},"hasTransform":false,"transform":[],"mark":"point","encoding":{"x":{"field":"Worldwide_Gross","type":"quantitative"},"y":{"field":"US_DVD_Sales","type":"quantitative"}},"config":[],"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}},"facet":{"col":{"field":"MPAA_Rating","type":"ordinal"}},"hasFacetCol":true},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### facet row


```r
vegalite(viewport_height=1400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("Worldwide_Gross", "quantitative") %>%
  encode_y("US_DVD_Sales", "quantitative") %>%
  facet_row("MPAA_Rating", "ordinal") %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-1231" style="width:672px;height:1400px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-1231">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/movies.json"},"hasTransform":false,"transform":[],"mark":"point","encoding":{"x":{"field":"Worldwide_Gross","type":"quantitative"},"y":{"field":"US_DVD_Sales","type":"quantitative"}},"config":[],"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}},"facet":{"row":{"field":"MPAA_Rating","type":"ordinal"}},"hasFacetRow":true},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### facet both


```r
vegalite(viewport_height=1600) %>%
  cell_size(100, 100) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("Worldwide_Gross", "quantitative") %>%
  encode_y("US_DVD_Sales", "quantitative") %>%
  facet_col("MPAA_Rating", "ordinal") %>%
  facet_row("Major_Genre", "ordinal") %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-9208" style="width:672px;height:1600px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-9208">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/movies.json"},"hasTransform":false,"transform":[],"mark":"point","encoding":{"x":{"field":"Worldwide_Gross","type":"quantitative"},"y":{"field":"US_DVD_Sales","type":"quantitative"}},"config":{"cell":{"width":100,"height":100}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}},"facet":{"col":{"field":"MPAA_Rating","type":"ordinal"},"row":{"field":"Major_Genre","type":"ordinal"}},"hasFacetCol":true,"hasFacetRow":true},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


---
title: "ex.r"
author: "bob"
date: "Thu Feb 25 22:19:36 2016"
---
