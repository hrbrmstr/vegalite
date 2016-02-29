# vegalite test
@hrbrmstr  
2016-02-27  


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

<!--html_preserve--><div id="htmlwidget-6085" style="width:672px;height:250px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-6085">{"x":{"description":"","data":{"values":{"a":["A","B","C","D","E","F","G","H","I"],"b":[28,55,43,91,81,53,19,87,52]}},"mark":"bar","encoding":{"x":{"field":"a","type":"ordinal"},"y":{"field":"b","type":"quantitative"}},"config":{"cell":{"width":400,"height":200}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### point mark


```r
vegalite() %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-5366" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-5366">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"mark":"point","encoding":{"x":{"field":"Horsepower","type":"quantitative"},"y":{"field":"Miles_per_Gallon","type":"quantitative"}},"config":{"cell":{"width":400,"height":400},"mark":{"shape":"circle"}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### cirlce mark


```r
vegalite() %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  mark_circle()
```

<!--html_preserve--><div id="htmlwidget-7193" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-7193">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"mark":"circle","encoding":{"x":{"field":"Horsepower","type":"quantitative"},"y":{"field":"Miles_per_Gallon","type":"quantitative"}},"config":{"cell":{"width":400,"height":400}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

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

<!--html_preserve--><div id="htmlwidget-2538" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-2538">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"mark":"point","encoding":{"x":{"field":"Horsepower","type":"quantitative"},"y":{"field":"Miles_per_Gallon","type":"quantitative"},"color":{"field":"Origin","type":"nominal"},"shape":{"field":"Origin","type":"nominal"}},"config":{"cell":{"width":400,"height":400},"mark":{"shape":"circle"}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

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

<!--html_preserve--><div id="htmlwidget-6281" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-6281">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"mark":"point","encoding":{"x":{"field":"Horsepower","type":"quantitative"},"y":{"field":"Miles_per_Gallon","type":"quantitative"},"size":{"field":"Acceleration","type":"quantitative"}},"config":{"cell":{"width":400,"height":400},"mark":{"shape":"circle"}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

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

<!--html_preserve--><div id="htmlwidget-349" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-349">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/stocks.csv"},"mark":"line","encoding":{"x":{"field":"date","type":"temporal"},"y":{"field":"price","type":"quantitative"}},"config":{"cell":{"width":400,"height":450}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}},"transform":{"filter":"datum.symbol==='GOOG'"}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### ticks


```r
vegalite(viewport_height=200) %>%
  cell_size(400, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Cylinders", "ordinal") %>%
  mark_tick()
```

<!--html_preserve--><div id="htmlwidget-5944" style="width:672px;height:200px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-5944">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"mark":"tick","encoding":{"x":{"field":"Horsepower","type":"quantitative"},"y":{"field":"Cylinders","type":"ordinal"}},"config":{"cell":{"width":400,"height":200},"mark":{"tickThickness":1}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

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

<!--html_preserve--><div id="htmlwidget-1581" style="width:672px;height:500px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-1581">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/stocks.csv"},"mark":"line","encoding":{"x":{"field":"date","type":"temporal"},"y":{"field":"price","type":"quantitative"},"color":{"field":"symbol","type":"nominal"}},"config":{"cell":{"width":400,"height":400}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### facet col


```r
vegalite(viewport_height=350) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("Worldwide_Gross", "quantitative") %>%
  encode_y("US_DVD_Sales", "quantitative") %>%
  facet_col("MPAA_Rating", "ordinal") %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-370" style="width:672px;height:350px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-370">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/movies.json"},"mark":"point","encoding":{"x":{"field":"Worldwide_Gross","type":"quantitative"},"y":{"field":"US_DVD_Sales","type":"quantitative"},"column":{"field":"MPAA_Rating","type":"ordinal","scale":{"round":true,"padding":16}}},"config":{"mark":{"shape":"circle"}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### facet row


```r
vegalite(viewport_height=1400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("Worldwide_Gross", "quantitative") %>%
  encode_y("US_DVD_Sales", "quantitative") %>%
  facet_row("MPAA_Rating", "ordinal") %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-2644" style="width:672px;height:1400px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-2644">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/movies.json"},"mark":"point","encoding":{"x":{"field":"Worldwide_Gross","type":"quantitative"},"y":{"field":"US_DVD_Sales","type":"quantitative"},"row":{"field":"MPAA_Rating","type":"ordinal","scale":{"round":true,"padding":16}}},"config":{"mark":{"shape":"circle"}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

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

<!--html_preserve--><div id="htmlwidget-6595" style="width:672px;height:2900px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-6595">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/movies.json"},"mark":"point","encoding":{"x":{"field":"Worldwide_Gross","type":"quantitative"},"y":{"field":"US_DVD_Sales","type":"quantitative"},"column":{"field":"MPAA_Rating","type":"ordinal","scale":{"round":true,"padding":16}},"row":{"field":"Major_Genre","type":"ordinal","scale":{"round":true,"padding":16}}},"config":{"mark":{"shape":"circle"}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### log scale


```r
dat <- jsonlite::fromJSON('[
      {"x": 0, "y": 1}, {"x": 1, "y": 10},
      {"x": 2, "y": 100}, {"x": 3, "y": 1000},
      {"x": 4, "y": 10000}, {"x": 5, "y": 100000},
      {"x": 6, "y": 1000000}, {"x": 7, "y": 10000000}
    ]')

vegalite(viewport_height=300) %>%
  add_data(dat) %>%
  encode_x("x", "quantitative") %>%
  encode_y("y", "quantitative") %>%
  mark_point() %>%
  scale_y_log()
```

<!--html_preserve--><div id="htmlwidget-1552" style="width:672px;height:300px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-1552">{"x":{"description":"","data":{"values":{"x":[0,1,2,3,4,5,6,7],"y":[1,10,100,1000,10000,100000,1000000,10000000]}},"mark":"point","encoding":{"x":{"field":"x","type":"quantitative"},"y":{"field":"y","type":"quantitative","scale":{"type":"log"}}},"config":{"mark":{"shape":"circle"}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### aggregate bar chart


```r
vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/population.json") %>%
  encode_x("people", "quantitative", aggregate="sum") %>%
  encode_y("age", "ordinal") %>%
  scale_y_ordinal(band_size=17) %>%
  add_filter("datum.year == 2000") %>%
  mark_bar()
```

<!--html_preserve--><div id="htmlwidget-8080" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-8080">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/population.json"},"mark":"bar","encoding":{"x":{"field":"people","type":"quantitative","aggregate":"sum"},"y":{"field":"age","type":"ordinal","scale":{"bandSize":17}}},"config":[],"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}},"transform":{"filter":"datum.year == 2000"}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### binned scatterplot


```r
vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("IMDB_Rating", "quantitative") %>%
  encode_y("Rotten_Tomatoes_Rating", "quantitative") %>%
  encode_size("*", "quantitative", aggregate="count") %>%
  bin_x(maxbins=10) %>%
  bin_y(maxbins=10) %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-8260" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-8260">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/movies.json"},"mark":"point","encoding":{"x":{"field":"IMDB_Rating","type":"quantitative","bin":{"maxbins":10}},"y":{"field":"Rotten_Tomatoes_Rating","type":"quantitative","bin":{"maxbins":10}},"size":{"field":"*","type":"quantitative","aggregate":"count"}},"config":{"mark":{"shape":"circle"}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### slope graph


```r
vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/barley.json") %>%
  encode_x("year", "ordinal") %>%
  encode_y("yield", "quantitative", aggregate="median") %>%
  encode_color("site", "nominal") %>%
  scale_x_ordinal(band_size=50, padding=0.5) %>%
  mark_line()
```

<!--html_preserve--><div id="htmlwidget-4064" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-4064">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/barley.json"},"mark":"line","encoding":{"x":{"field":"year","type":"ordinal","scale":{"bandSize":50,"padding":0.5}},"y":{"field":"yield","type":"quantitative","aggregate":"median"},"color":{"field":"site","type":"nominal"}},"config":[],"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### histogram


```r
vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("IMDB_Rating", "quantitative") %>%
  encode_y("*", "quantitative", aggregate="count") %>%
  bin_x(maxbins=10) %>%
  mark_bar()
```

<!--html_preserve--><div id="htmlwidget-9440" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-9440">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/movies.json"},"mark":"bar","encoding":{"x":{"field":"IMDB_Rating","type":"quantitative","bin":{"maxbins":10}},"y":{"field":"*","type":"quantitative","aggregate":"count"}},"config":[],"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### stacked bar chart


```r
vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/seattle-weather.csv") %>%
  encode_x("date", "temporal") %>%
  encode_y("*", "quantitative", aggregate="count") %>%
  encode_color("weather", "nominal") %>%
  scale_color_nominal(domain=c("sun","fog","drizzle","rain","snow"),
                      range=c("#e7ba52","#c7c7c7","#aec7e8","#1f77b4","#9467bd")) %>%
  timeunit_x("month") %>%
  mark_bar()
```

<!--html_preserve--><div id="htmlwidget-8005" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-8005">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/seattle-weather.csv"},"mark":"bar","encoding":{"x":{"field":"date","type":"temporal","timeUnit":"month"},"y":{"field":"*","type":"quantitative","aggregate":"count"},"color":{"field":"weather","type":"nominal","scale":{"domain":["sun","fog","drizzle","rain","snow"],"range":["#e7ba52","#c7c7c7","#aec7e8","#1f77b4","#9467bd"]}}},"config":[],"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### horizontal stacked bar chart


```r
vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/barley.json") %>%
  encode_x("yield", "quantitative", aggregate="sum") %>%
  encode_y("variety", "nominal") %>%
  encode_color("site", "nominal") %>%
  mark_bar()
```

<!--html_preserve--><div id="htmlwidget-8825" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-8825">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/barley.json"},"mark":"bar","encoding":{"x":{"field":"yield","type":"quantitative","aggregate":"sum"},"y":{"field":"variety","type":"nominal"},"color":{"field":"site","type":"nominal"}},"config":[],"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### stacked area chart


```r
vegalite() %>%
  cell_size(300, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json") %>%
  encode_x("date", "temporal") %>%
  encode_y("count", "quantitative", aggregate="sum") %>%
  encode_color("series", "nominal") %>%
  scale_color_nominal(range="category20b") %>%
  timeunit_x("yearmonth") %>%
  scale_x_time(nice="month") %>%
  axis_x(axisWidth=0, format="%Y", labelAngle=0) %>%
  mark_area()
```

<!--html_preserve--><div id="htmlwidget-8231" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-8231">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json"},"mark":"area","encoding":{"x":{"field":"date","type":"temporal","timeUnit":"yearmonth","scale":{"nice":"month"},"axis":{"axisWidth":0,"labels":true,"labelAngle":0,"labelMaxLength":25,"title":"","characterWidth":6,"format":"%Y"}},"y":{"field":"count","type":"quantitative","aggregate":"sum"},"color":{"field":"series","type":"nominal","scale":{"range":"category20b"}}},"config":{"cell":{"width":300,"height":200}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### streamgraph!


```r
vegalite() %>%
  cell_size(300, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json") %>%
  encode_x("date", "temporal") %>%
  encode_y("count", "quantitative", aggregate="sum") %>%
  encode_color("series", "nominal") %>%
  scale_color_nominal(range="category20b") %>%
  timeunit_x("yearmonth") %>%
  scale_x_time(nice="month") %>%
  axis_x(axisWidth=0, format="%Y", labelAngle=0) %>%
  mark_area(interpolate="basis", stack="center")
```

<!--html_preserve--><div id="htmlwidget-41" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-41">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json"},"mark":"area","encoding":{"x":{"field":"date","type":"temporal","timeUnit":"yearmonth","scale":{"nice":"month"},"axis":{"axisWidth":0,"labels":true,"labelAngle":0,"labelMaxLength":25,"title":"","characterWidth":6,"format":"%Y"}},"y":{"field":"count","type":"quantitative","aggregate":"sum"},"color":{"field":"series","type":"nominal","scale":{"range":"category20b"}}},"config":{"cell":{"width":300,"height":200},"mark":{"stacked":"center","interpolate":"basis"}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### scatter text


```r
vegalite() %>%
  cell_size(300, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  encode_color("Origin", "nominal") %>%
  calculate("OriginInitial", "datum.Origin[0]") %>%
  encode_text("OriginInitial", "nominal") %>%
  mark_text()
```

<!--html_preserve--><div id="htmlwidget-8966" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-8966">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"mark":"text","encoding":{"x":{"field":"Horsepower","type":"quantitative"},"y":{"field":"Miles_per_Gallon","type":"quantitative"},"color":{"field":"Origin","type":"nominal"},"text":{"field":"OriginInitial","type":"nominal"}},"config":{"cell":{"width":300,"height":200}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}},"transform":{"calculate":{"field":["OriginInitial"],"expr":["datum.Origin[0]"]}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### area chart


```r
vegalite() %>%
  cell_size(300, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json") %>%
  encode_x("date", "temporal") %>%
  timeunit_x("yearmonth") %>%
  axis_x(axisWidth=0, format="%Y", labelAngle=0) %>%
  encode_y("count", "quantitative", aggregate="sum") %>%
  mark_area()
```

<!--html_preserve--><div id="htmlwidget-8953" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-8953">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json"},"mark":"area","encoding":{"x":{"field":"date","type":"temporal","timeUnit":"yearmonth","axis":{"axisWidth":0,"labels":true,"labelAngle":0,"labelMaxLength":25,"title":"","characterWidth":6,"format":"%Y"}},"y":{"field":"count","type":"quantitative","aggregate":"sum"}},"config":{"cell":{"width":300,"height":200}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### grouped bar chart


```r
vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/population.json") %>%
  add_filter("datum.year == 2000") %>%
  calculate("gender", 'datum.sex == 2 ? "Female" : "Male"') %>%
  encode_x("gender", "nominal") %>%
  encode_y("people", "quantitative", aggregate="sum") %>%
  encode_color("gender", "nominal") %>%
  scale_x_ordinal(band_size=6) %>%
  scale_color_nominal(range=c("#EA98D2", "#659CCA")) %>%
  facet_col("age", "ordinal", padding=4) %>%
  axis_x(remove=TRUE) %>%
  axis_y(title="population", grid=FALSE) %>%
  axis_facet_col(orient="bottom", axisWidth=1, offset=-8) %>%
  facet_cell(stroke_width=0) %>%
  mark_bar()
```

<!--html_preserve--><div id="htmlwidget-1769" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-1769">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/population.json"},"mark":"bar","encoding":{"x":{"field":"gender","type":"nominal","scale":{"bandSize":6},"axis":false},"y":{"field":"people","type":"quantitative","aggregate":"sum","axis":{"grid":false,"labels":true,"labelMaxLength":25,"title":"population","characterWidth":6}},"color":{"field":"gender","type":"nominal","scale":{"range":["#EA98D2","#659CCA"]}},"column":{"field":"age","type":"ordinal","scale":{"round":true,"padding":4},"axis":{"axisWidth":1,"offset":-8,"grid":false,"labels":true,"labelMaxLength":25,"tickSize":0,"title":"","characterWidth":6,"orient":"bottom"}}},"config":{"facet":{"cell":{"width":200,"height":200,"strokeWidth":0}}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}},"transform":{"filter":"datum.year == 2000","calculate":{"field":["gender"],"expr":["datum.sex == 2 ? \"Female\" : \"Male\""]}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### normalized stacked bar chart


```r
vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/population.json") %>%
  calculate("gender", 'datum.sex == 2 ? "Female" : "Male"') %>%
  encode_x("age", "ordinal") %>%
  encode_y("people", "quantitative", aggregate="sum") %>%
  encode_color("gender", "nominal") %>%
  scale_x_ordinal(band_size=17) %>%
  scale_color_nominal(range=c("#EA98D2", "#659CCA")) %>%
  mark_bar(stack="normalize")
```

<!--html_preserve--><div id="htmlwidget-4639" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-4639">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/population.json"},"mark":"bar","encoding":{"x":{"field":"age","type":"ordinal","scale":{"bandSize":17}},"y":{"field":"people","type":"quantitative","aggregate":"sum"},"color":{"field":"gender","type":"nominal","scale":{"range":["#EA98D2","#659CCA"]}}},"config":{"mark":{"stacked":"normalize"}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}},"transform":{"calculate":{"field":["gender"],"expr":["datum.sex == 2 ? \"Female\" : \"Male\""]}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### normalized stacked bar chart


```r
vegalite() %>%
  cell_size(300, 300) %>%
  add_data("https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json") %>%
  encode_x("date", "temporal") %>%
  encode_y("count", "quantitative", aggregate="sum") %>%
  encode_color("series", "nominal") %>%
  scale_x_time(nice="month") %>%
  scale_color_nominal(range="category20b") %>%
  axis_x(axisWidth=0, format="%Y", labelAngle=0) %>%
  axis_y(remove=TRUE) %>%
  timeunit_x("yearmonth") %>%
  mark_area(stack="normalize")
```

<!--html_preserve--><div id="htmlwidget-6675" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-6675">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json"},"mark":"area","encoding":{"x":{"field":"date","type":"temporal","scale":{"nice":"month"},"axis":{"axisWidth":0,"labels":true,"labelAngle":0,"labelMaxLength":25,"title":"","characterWidth":6,"format":"%Y"},"timeUnit":"yearmonth"},"y":{"field":"count","type":"quantitative","aggregate":"sum","axis":false},"color":{"field":"series","type":"nominal","scale":{"range":"category20b"}}},"config":{"cell":{"width":300,"height":300},"mark":{"stacked":"normalize"}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### layered bar chart


```r
vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/population.json") %>%
  add_filter("datum.year == 2000") %>%
  calculate("gender", 'datum.sex == 2 ? "Female" : "Male"') %>%
  encode_x("age", "ordinal") %>%
  encode_y("people", "quantitative", aggregate="sum") %>%
  encode_color("gender", "nominal") %>%
  scale_x_ordinal(band_size=17) %>%
  scale_color_nominal(range=c("#e377c2","#1f77b4")) %>%
  axis_y(title="Population") %>%
  mark_bar(opacity=0.6, stack="none")
```

<!--html_preserve--><div id="htmlwidget-160" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-160">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/population.json"},"mark":"bar","encoding":{"x":{"field":"age","type":"ordinal","scale":{"bandSize":17}},"y":{"field":"people","type":"quantitative","aggregate":"sum","axis":{"labels":true,"labelMaxLength":25,"title":"Population","characterWidth":6}},"color":{"field":"gender","type":"nominal","scale":{"range":["#e377c2","#1f77b4"]}}},"config":{"mark":{"stacked":"none","opacity":0.6}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}},"transform":{"filter":"datum.year == 2000","calculate":{"field":["gender"],"expr":["datum.sex == 2 ? \"Female\" : \"Male\""]}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### trellis bar chart


```r
vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/population.json") %>%
  add_filter("datum.year == 2000") %>%
  calculate("gender", 'datum.sex == 2 ? "Female" : "Male"') %>%
  encode_x("age", "ordinal") %>%
  encode_y("people", "quantitative", aggregate="sum") %>%
  encode_color("gender", "nominal") %>%
  facet_row("gender", "nominal") %>%
  scale_x_ordinal(band_size=17) %>%
  scale_color_nominal(range=c("#EA98D2","#659CCA")) %>%
  axis_y(title="Population") %>%
  mark_bar()
```

<!--html_preserve--><div id="htmlwidget-448" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-448">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/population.json"},"mark":"bar","encoding":{"x":{"field":"age","type":"ordinal","scale":{"bandSize":17}},"y":{"field":"people","type":"quantitative","aggregate":"sum","axis":{"labels":true,"labelMaxLength":25,"title":"Population","characterWidth":6}},"color":{"field":"gender","type":"nominal","scale":{"range":["#EA98D2","#659CCA"]}},"row":{"field":"gender","type":"nominal","scale":{"round":true,"padding":16}}},"config":[],"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}},"transform":{"filter":"datum.year == 2000","calculate":{"field":["gender"],"expr":["datum.sex == 2 ? \"Female\" : \"Male\""]}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### trellis stacked bar chart


```r
vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/barley.json") %>%
  encode_x("yield", "quantitative", aggregate="sum") %>%
  encode_y("variety", "nominal") %>%
  encode_color("site", "nominal") %>%
  facet_col("year", "ordinal") %>%
  mark_bar()
```

<!--html_preserve--><div id="htmlwidget-6060" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-6060">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/barley.json"},"mark":"bar","encoding":{"x":{"field":"yield","type":"quantitative","aggregate":"sum"},"y":{"field":"variety","type":"nominal"},"color":{"field":"site","type":"nominal"},"column":{"field":"year","type":"ordinal","scale":{"round":true,"padding":16}}},"config":[],"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### trellis histograms


```r
vegalite(viewport_height=700) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("*", "quantitative", aggregate="count") %>%
  encode_color("site", "nominal") %>%
  facet_row("Origin", "nominal") %>%
  bin_x(maxbins=15) %>%
  mark_bar()
```

<!--html_preserve--><div id="htmlwidget-1894" style="width:672px;height:700px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-1894">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"mark":"bar","encoding":{"x":{"field":"Horsepower","type":"quantitative","bin":{"maxbins":15}},"y":{"field":"*","type":"quantitative","aggregate":"count"},"color":{"field":"site","type":"nominal"},"row":{"field":"Origin","type":"nominal","scale":{"round":true,"padding":16}}},"config":[],"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### becker's barley trellis plot


```r
vegalite(viewport_height=1200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/barley.json") %>%
  encode_x("yield", "quantitative", aggregate="mean") %>%
  encode_y("variety", "ordinal", sort=sort_def("yield", "mean")) %>%
  encode_color("year", "nominal") %>%
  facet_row("site", "ordinal") %>%
  scale_y_ordinal(band_size=12) %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-7328" style="width:672px;height:1200px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-7328">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/barley.json"},"mark":"point","encoding":{"x":{"field":"yield","type":"quantitative","aggregate":"mean"},"y":{"field":"variety","type":"ordinal","sort":{"field":"yield","op":"mean","order":"ascending"},"scale":{"bandSize":12}},"color":{"field":"year","type":"nominal"},"row":{"field":"site","type":"ordinal","scale":{"round":true,"padding":16}}},"config":{"mark":{"shape":"circle"}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### sorting line order


```r
vegalite() %>%
  cell_size(300, 300) %>%
  add_data("https://vega.github.io/vega-editor/app/data/driving.json") %>%
  encode_x("miles", "quantitative") %>%
  encode_y("gas", "quantitative") %>%
  encode_path("year", "temporal") %>%
  scale_x_linear(zero=FALSE) %>%
  scale_y_linear(zero=FALSE) %>%
  mark_line()
```

<!--html_preserve--><div id="htmlwidget-5121" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-5121">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/driving.json"},"mark":"line","encoding":{"x":{"field":"miles","type":"quantitative","scale":{"zero":false}},"y":{"field":"gas","type":"quantitative","scale":{"zero":false}},"path":{"field":"year","type":"temporal"}},"config":{"cell":{"width":300,"height":300}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### sort layer scatterplot


```r
vegalite() %>%
  cell_size(200, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  encode_color("Origin", "nominal") %>%
  encode_order("Origin", "ordinal", sort="descending") %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-1601" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-1601">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"mark":"point","encoding":{"x":{"field":"Horsepower","type":"quantitative"},"y":{"field":"Miles_per_Gallon","type":"quantitative"},"color":{"field":"Origin","type":"nominal"},"order":{"field":"Origin","type":"ordinal","sort":"descending"}},"config":{"cell":{"width":200,"height":200},"mark":{"shape":"circle"}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### detail lines


```r
vegalite() %>%
  cell_size(200, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/stocks.csv") %>%
  encode_x("date", "temporal") %>%
  encode_y("price", "quantitative") %>%
  encode_detail("symbol", "nominal") %>%
  mark_line()
```

<!--html_preserve--><div id="htmlwidget-552" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-552">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/stocks.csv"},"mark":"line","encoding":{"x":{"field":"date","type":"temporal"},"y":{"field":"price","type":"quantitative"},"detail":{"field":"symbol","type":"nominal"}},"config":{"cell":{"width":200,"height":200}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### detail points


```r
vegalite() %>%
  cell_size(200, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative", aggregate="mean") %>%
  encode_y("Displacement", "quantitative", aggregate="mean") %>%
  encode_detail("Origin", "nominal") %>%
  mark_point()
```

<!--html_preserve--><div id="htmlwidget-8821" style="width:672px;height:480px;" class="vegalite"></div>
<script type="application/json" data-for="htmlwidget-8821">{"x":{"description":"","data":{"url":"https://vega.github.io/vega-editor/app/data/cars.json"},"mark":"point","encoding":{"x":{"field":"Horsepower","type":"quantitative","aggregate":"mean"},"y":{"field":"Displacement","type":"quantitative","aggregate":"mean"},"detail":{"field":"Origin","type":"nominal"}},"config":{"cell":{"width":200,"height":200},"mark":{"shape":"circle"}},"embed":{"renderer":"svg","actions":{"export":false,"source":false,"editor":false}}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


---
title: "ex.r"
author: "bob"
date: "Sun Feb 28 21:02:02 2016"
---
