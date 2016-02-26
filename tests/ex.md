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

<!--html_preserve--><div id="htmlwidget-8612" style="width:672px;height:250px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-8612">{"x":{"description":"","data":{"values":{"a":["A","B","C","D","E","F","G","H","I"],"b":[28,55,43,91,81,53,19,87,52]}},"mark":"bar","encoding":{"x":{"field":"a","type":"ordinal"},"y":{"field":"b","type":"quantitative"}},"config":{"cell":{"width":400,"height":200}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### point mark


```r
vegalite() %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-3651" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-3651">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"mark":"point","encoding":{"x":{"field":"Horsepower","type":"quantitative"},"y":{"field":"Miles_per_Gallon","type":"quantitative"}},"config":{"cell":{"width":400,"height":400},"mark":{"shape":"circle","size":30}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### cirlce mark


```r
vegalite() %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  mark_circle()
```

<!--html_preserve--><div id="htmlwidget-1785" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-1785">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"mark":"circle","encoding":{"x":{"field":"Horsepower","type":"quantitative"},"y":{"field":"Miles_per_Gallon","type":"quantitative"}},"config":{"cell":{"width":400,"height":400},"mark":{"size":30}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

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

<!--html_preserve--><div id="htmlwidget-4969" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-4969">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"mark":"point","encoding":{"x":{"field":"Horsepower","type":"quantitative"},"y":{"field":"Miles_per_Gallon","type":"quantitative"},"color":{"field":"Origin","type":"nominal"},"shape":{"field":"Origin","type":"nominal"}},"config":{"cell":{"width":400,"height":400},"mark":{"shape":"circle","size":30}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

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

<!--html_preserve--><div id="htmlwidget-5183" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-5183">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"mark":"point","encoding":{"x":{"field":"Horsepower","type":"quantitative"},"y":{"field":"Miles_per_Gallon","type":"quantitative"},"size":{"field":"Acceleration","type":"quantitative"}},"config":{"cell":{"width":400,"height":400},"mark":{"shape":"circle","size":30}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

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

<!--html_preserve--><div id="htmlwidget-2633" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-2633">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/stocks.csv"},"mark":"line","encoding":{"x":{"field":"date","type":"temporal"},"y":{"field":"price","type":"quantitative"}},"config":{"cell":{"width":400,"height":450}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}},"transform":{"filter":"datum.symbol==='GOOG'"}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### ticks


```r
vegalite(viewport_height=200) %>%
  cell_size(400, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Cylinders", "ordinal") %>%
  mark_tick()
```

<!--html_preserve--><div id="htmlwidget-1152" style="width:672px;height:200px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-1152">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"mark":"tick","encoding":{"x":{"field":"Horsepower","type":"quantitative"},"y":{"field":"Cylinders","type":"ordinal"}},"config":{"cell":{"width":400,"height":200},"mark":{"tickThickness":1}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

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

<!--html_preserve--><div id="htmlwidget-5905" style="width:672px;height:500px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-5905">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/stocks.csv"},"mark":"line","encoding":{"x":{"field":"date","type":"temporal"},"y":{"field":"price","type":"quantitative"},"color":{"field":"symbol","type":"nominal"}},"config":{"cell":{"width":400,"height":400}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### facet col


```r
vegalite(viewport_height=350) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("Worldwide_Gross", "quantitative") %>%
  encode_y("US_DVD_Sales", "quantitative") %>%
  facet_col("MPAA_Rating", "ordinal") %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-6269" style="width:672px;height:350px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-6269">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/movies.json"},"mark":"point","encoding":{"x":{"field":"Worldwide_Gross","type":"quantitative"},"y":{"field":"US_DVD_Sales","type":"quantitative"},"column":{"field":"MPAA_Rating","type":"ordinal"}},"config":{"mark":{"shape":"circle","size":30}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### facet row


```r
vegalite(viewport_height=1400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("Worldwide_Gross", "quantitative") %>%
  encode_y("US_DVD_Sales", "quantitative") %>%
  facet_row("MPAA_Rating", "ordinal") %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-2556" style="width:672px;height:1400px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-2556">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/movies.json"},"mark":"point","encoding":{"x":{"field":"Worldwide_Gross","type":"quantitative"},"y":{"field":"US_DVD_Sales","type":"quantitative"},"row":{"field":"MPAA_Rating","type":"ordinal"}},"config":{"mark":{"shape":"circle","size":30}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### facet both


```r
vegalite(viewport_height=2900) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("Worldwide_Gross", "quantitative") %>%
  encode_y("US_DVD_Sales", "quantitative") %>%
  facet_col("MPAA_Rating", "ordinal") %>%
  facet_row("Major_Genre", "ordinal") %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-4409" style="width:672px;height:2900px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-4409">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/movies.json"},"mark":"point","encoding":{"x":{"field":"Worldwide_Gross","type":"quantitative"},"y":{"field":"US_DVD_Sales","type":"quantitative"},"column":{"field":"MPAA_Rating","type":"ordinal"},"row":{"field":"Major_Genre","type":"ordinal"}},"config":{"mark":{"shape":"circle","size":30}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### log scale


```r
vegalite(viewport_height=300) %>%
  add_data(jsonlite::fromJSON('[
      {"x": 0, "y": 1}, {"x": 1, "y": 10},
      {"x": 2, "y": 100}, {"x": 3, "y": 1000},
      {"x": 4, "y": 10000}, {"x": 5, "y": 100000},
      {"x": 6, "y": 1000000}, {"x": 7, "y": 10000000}
    ]')) %>%
  encode_x("x", "quantitative") %>%
  encode_y("y", "quantitative") %>%
  mark_point() %>%
  scale_y_log()
```

<!--html_preserve--><div id="htmlwidget-4162" style="width:672px;height:300px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-4162">{"x":{"description":"","data":{"values":{"x":[0,1,2,3,4,5,6,7],"y":[1,10,100,1000,10000,100000,1000000,10000000]}},"mark":"point","encoding":{"x":{"field":"x","type":"quantitative"},"y":{"field":"y","type":"quantitative","scale":{"type":"log"}}},"config":{"mark":{"shape":"circle","size":30}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### aggregate bar chart


```r
vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/population.json") %>%
  encode_x("people", "quantitative") %>%
  aggregate_x("sum") %>%
  encode_y("age", "ordinal") %>%
  scale_y_ordinal(band_size=17) %>%
  add_filter("datum.year == 2000") %>%
  mark_bar()
```

<!--html_preserve--><div id="htmlwidget-7616" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-7616">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/population.json"},"mark":"bar","encoding":{"x":{"field":"people","type":"quantitative","aggregate":"sum"},"y":{"field":"age","type":"ordinal","scale":{"type":"ordinal","bandSize":17}}},"config":[],"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}},"transform":{"filter":"datum.year == 2000"}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### binned scatterplot


```r
vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("IMDB_Rating", "quantitative") %>%
  encode_y("Rotten_Tomatoes_Rating", "quantitative") %>%
  encode_size("*", "quantitative") %>%
  bin_x(maxbins=10) %>%
  bin_y(maxbins=10) %>%
  aggregate_size("count") %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-6703" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-6703">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/movies.json"},"mark":"point","encoding":{"x":{"field":"IMDB_Rating","type":"quantitative","bin":{"maxbins":10}},"y":{"field":"Rotten_Tomatoes_Rating","type":"quantitative","bin":{"maxbins":10}},"size":{"field":"*","type":"quantitative","aggregate":"count"}},"config":{"mark":{"shape":"circle","size":30}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### slope graph


```r
vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/barley.json") %>%
  encode_x("year", "ordinal") %>%
  encode_y("yield", "quantitative") %>%
  encode_color("site", "nominal") %>%
  aggregate_y("median") %>%
  scale_x_ordinal(band_size=50, padding=0.5) %>%
  mark_line()
```

<!--html_preserve--><div id="htmlwidget-7178" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-7178">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/barley.json"},"mark":"line","encoding":{"x":{"field":"year","type":"ordinal","scale":{"type":"ordinal","bandSize":50,"padding":0.5}},"y":{"field":"yield","type":"quantitative","aggregate":"median"},"color":{"field":"site","type":"nominal"}},"config":[],"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### histogram


```r
vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("IMDB_Rating", "quantitative") %>%
  encode_y("*", "quantitative") %>%
  bin_x(maxbins=10) %>%
  aggregate_y("count") %>%
  mark_bar()
```

<!--html_preserve--><div id="htmlwidget-4287" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-4287">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/movies.json"},"mark":"bar","encoding":{"x":{"field":"IMDB_Rating","type":"quantitative","bin":{"maxbins":10}},"y":{"field":"*","type":"quantitative","aggregate":"count"}},"config":[],"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### stacked bar chart


```r
vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/seattle-weather.csv") %>%
  encode_x("date", "temporal") %>%
  encode_y("*", "quantitative") %>%
  encode_color("weather", "nominal") %>%
  aggregate_y("count") %>%
  scale_color_nominal(domain=c("sun","fog","drizzle","rain","snow"),
                      range=c("#e7ba52","#c7c7c7","#aec7e8","#1f77b4","#9467bd")) %>%
  timeunit_x("month") %>%
  mark_bar()
```

<!--html_preserve--><div id="htmlwidget-3425" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-3425">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/seattle-weather.csv"},"mark":"bar","encoding":{"x":{"field":"date","type":"temporal","timeUnit":"month"},"y":{"field":"*","type":"quantitative","aggregate":"count"},"color":{"field":"weather","type":"nominal","scale":{"domain":["sun","fog","drizzle","rain","snow"],"range":["#e7ba52","#c7c7c7","#aec7e8","#1f77b4","#9467bd"]}}},"config":[],"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### horizontal stacked bar chart


```r
vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/barley.json") %>%
  encode_x("yield", "quantitative") %>%
  encode_y("variety", "nominal") %>%
  encode_color("site", "nominal") %>%
  aggregate_x("sum") %>%
  mark_bar()
```

<!--html_preserve--><div id="htmlwidget-2761" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-2761">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/barley.json"},"mark":"bar","encoding":{"x":{"field":"yield","type":"quantitative","aggregate":"sum"},"y":{"field":"variety","type":"nominal"},"color":{"field":"site","type":"nominal"}},"config":[],"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### stacked area chart


```r
vegalite() %>%
  cell_size(300, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json") %>%
  encode_x("date", "temporal") %>%
  encode_y("count", "quantitative") %>%
  encode_color("series", "nominal") %>%
  aggregate_y("sum") %>%
  scale_color_nominal(range="category20b") %>%
  timeunit_x("yearmonth") %>%
  scale_x_time(nice="month") %>%
  axis_x(axisWidth=0, format="%Y", labelAngle=0) %>%
  mark_area()
```

<!--html_preserve--><div id="htmlwidget-7042" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-7042">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json"},"mark":"area","encoding":{"x":{"field":"date","type":"temporal","timeUnit":"yearmonth","scale":{"nice":"month"},"axis":{"axisWidth":0,"format":"%Y","labelAngle":0}},"y":{"field":"count","type":"quantitative","aggregate":"sum"},"color":{"field":"series","type":"nominal","scale":{"range":"category20b"}}},"config":{"cell":{"width":300,"height":200}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### streamgraph!


```r
vegalite() %>%
  cell_size(300, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json") %>%
  encode_x("date", "temporal") %>%
  encode_y("count", "quantitative") %>%
  encode_color("series", "nominal") %>%
  aggregate_y("sum") %>%
  scale_color_nominal(range="category20b") %>%
  timeunit_x("yearmonth") %>%
  scale_x_time(nice="month") %>%
  axis_x(axisWidth=0, format="%Y", labelAngle=0) %>%
  mark_area(interpolate="basis", stack="center")
```

<!--html_preserve--><div id="htmlwidget-1898" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-1898">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json"},"mark":"area","encoding":{"x":{"field":"date","type":"temporal","timeUnit":"yearmonth","scale":{"nice":"month"},"axis":{"axisWidth":0,"format":"%Y","labelAngle":0}},"y":{"field":"count","type":"quantitative","aggregate":"sum"},"color":{"field":"series","type":"nominal","scale":{"range":"category20b"}}},"config":{"cell":{"width":300,"height":200},"mark":{"stacked":"center","interpolate":"basis"}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


---
title: "ex.r"
author: "bob"
date: "Fri Feb 26 07:45:29 2016"
---
