## ------------------------------------------------------------------------
library(vegalite)

## ------------------------------------------------------------------------
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

## ------------------------------------------------------------------------
vegalite(viewport_width=400, viewport_height=400) %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  mark_point()

## ------------------------------------------------------------------------
vegalite(viewport_width=400, viewport_height=400) %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  mark_circle()

## ------------------------------------------------------------------------
vegalite(viewport_width=400, viewport_height=400) %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  encode_color("Origin", "nominal") %>%
  encode_shape("Origin", "nominal") %>%
  mark_point()

## ------------------------------------------------------------------------
vegalite(viewport_width=400, viewport_height=400) %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  encode_size("Acceleration", "quantitative") %>%
  mark_point()

## ------------------------------------------------------------------------
vegalite(viewport_width=400, viewport_height=450) %>%
  cell_size(400, 450) %>%
  add_data("https://vega.github.io/vega-editor/app/data/stocks.csv") %>%
  add_filter("datum.symbol==='GOOG'") %>%
  encode_x("date", "temporal") %>%
  encode_y("price", "quantitative") %>%
  mark_line()

## ------------------------------------------------------------------------
vegalite(viewport_height=200) %>%
  cell_size(400, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Cylinders", "ordinal") %>%
  mark_tick()

## ------------------------------------------------------------------------
vegalite(viewport_height=500) %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/stocks.csv") %>%
  encode_x("date", "temporal") %>%
  encode_y("price", "quantitative") %>%
  encode_color("symbol", "nominal") %>%
  mark_line()

## ------------------------------------------------------------------------
vegalite(viewport_height=350) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("Worldwide_Gross", "quantitative") %>%
  encode_y("US_DVD_Sales", "quantitative") %>%
  facet_col("MPAA_Rating", "ordinal") %>%
  mark_point()

## ------------------------------------------------------------------------
vegalite(viewport_height=1400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("Worldwide_Gross", "quantitative") %>%
  encode_y("US_DVD_Sales", "quantitative") %>%
  facet_row("MPAA_Rating", "ordinal") %>%
  mark_point()

## ------------------------------------------------------------------------
vegalite(viewport_height=2900) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("Worldwide_Gross", "quantitative") %>%
  encode_y("US_DVD_Sales", "quantitative") %>%
  facet_col("MPAA_Rating", "ordinal") %>%
  facet_row("Major_Genre", "ordinal") %>%
  mark_point()

## ------------------------------------------------------------------------
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

## ------------------------------------------------------------------------
vegalite(viewport_width=500, viewport_height=400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/population.json") %>%
  encode_x("people", "quantitative", aggregate="sum") %>%
  encode_y("age", "ordinal") %>%
  scale_y_ordinal(band_size=17) %>%
  add_filter("datum.year == 2000") %>%
  mark_bar()

## ------------------------------------------------------------------------
vegalite(viewport_width=400, viewport_height=400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("IMDB_Rating", "quantitative") %>%
  encode_y("Rotten_Tomatoes_Rating", "quantitative") %>%
  encode_size("*", "quantitative", aggregate="count") %>%
  bin_x(maxbins=10) %>%
  bin_y(maxbins=10) %>%
  mark_point()

## ------------------------------------------------------------------------
vegalite(viewport_width=400, viewport_height=600) %>%
  add_data("https://vega.github.io/vega-editor/app/data/barley.json") %>%
  encode_x("year", "ordinal") %>%
  encode_y("yield", "quantitative", aggregate="median") %>%
  encode_color("site", "nominal") %>%
  scale_x_ordinal(band_size=50, padding=0.5) %>%
  mark_line()

## ------------------------------------------------------------------------
vegalite(viewport_width=400, viewport_height=400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("IMDB_Rating", "quantitative") %>%
  encode_y("*", "quantitative", aggregate="count") %>%
  bin_x(maxbins=10) %>%
  mark_bar()

## ------------------------------------------------------------------------
vegalite(viewport_width=400, viewport_height=400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/seattle-weather.csv") %>%
  encode_x("date", "temporal") %>%
  encode_y("*", "quantitative", aggregate="count") %>%
  encode_color("weather", "nominal") %>%
  scale_color_nominal(domain=c("sun","fog","drizzle","rain","snow"),
                      range=c("#e7ba52","#c7c7c7","#aec7e8","#1f77b4","#9467bd")) %>%
  timeunit_x("month") %>%
  mark_bar()

## ------------------------------------------------------------------------
vegalite(viewport_width=400, viewport_height=400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/barley.json") %>%
  encode_x("yield", "quantitative", aggregate="sum") %>%
  encode_y("variety", "nominal") %>%
  encode_color("site", "nominal") %>%
  mark_bar()

## ------------------------------------------------------------------------
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

## ------------------------------------------------------------------------
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

## ------------------------------------------------------------------------
vegalite() %>%
  cell_size(300, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  encode_color("Origin", "nominal") %>%
  calculate("OriginInitial", "datum.Origin[0]") %>%
  encode_text("OriginInitial", "nominal") %>%
  mark_text()

## ------------------------------------------------------------------------
vegalite() %>%
  cell_size(300, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json") %>%
  encode_x("date", "temporal") %>%
  timeunit_x("yearmonth") %>%
  axis_x(axisWidth=0, format="%Y", labelAngle=0) %>%
  encode_y("count", "quantitative", aggregate="sum") %>%
  mark_area()

## ------------------------------------------------------------------------
vegalite(viewport_width=400, viewport_height=400) %>%
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

## ------------------------------------------------------------------------
vegalite(viewport_width=400, viewport_height=400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/population.json") %>%
  calculate("gender", 'datum.sex == 2 ? "Female" : "Male"') %>%
  encode_x("age", "ordinal") %>%
  encode_y("people", "quantitative", aggregate="sum") %>%
  encode_color("gender", "nominal") %>%
  scale_x_ordinal(band_size=17) %>%
  scale_color_nominal(range=c("#EA98D2", "#659CCA")) %>%
  mark_bar(stack="normalize")

## ------------------------------------------------------------------------
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

## ------------------------------------------------------------------------
vegalite(viewport_width=400, viewport_height=400) %>%
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

## ------------------------------------------------------------------------
vegalite(viewport_width=400, viewport_height=400) %>%
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

## ------------------------------------------------------------------------
vegalite(viewport_width=400, viewport_height=400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/barley.json") %>%
  encode_x("yield", "quantitative", aggregate="sum") %>%
  encode_y("variety", "nominal") %>%
  encode_color("site", "nominal") %>%
  facet_col("year", "ordinal") %>%
  mark_bar()

## ------------------------------------------------------------------------
vegalite(viewport_height=700) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("*", "quantitative", aggregate="count") %>%
  encode_color("site", "nominal") %>%
  facet_row("Origin", "nominal") %>%
  bin_x(maxbins=15) %>%
  mark_bar()

## ------------------------------------------------------------------------
vegalite(viewport_height=1200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/barley.json") %>%
  encode_x("yield", "quantitative", aggregate="mean") %>%
  encode_y("variety", "ordinal", sort=sort_def("yield", "mean")) %>%
  encode_color("year", "nominal") %>%
  facet_row("site", "ordinal") %>%
  scale_y_ordinal(band_size=12) %>%
  mark_point()

## ------------------------------------------------------------------------
vegalite(viewport_width=300, viewport_height=300) %>%
  cell_size(300, 300) %>%
  add_data("https://vega.github.io/vega-editor/app/data/driving.json") %>%
  encode_x("miles", "quantitative") %>%
  encode_y("gas", "quantitative") %>%
  encode_path("year", "temporal") %>%
  scale_x_linear(zero=FALSE) %>%
  scale_y_linear(zero=FALSE) %>%
  mark_line()

## ------------------------------------------------------------------------
vegalite(viewport_width=200, viewport_height=200) %>%
  cell_size(200, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  encode_color("Origin", "nominal") %>%
  encode_order("Origin", "ordinal", sort="descending") %>%
  mark_point()

## ------------------------------------------------------------------------
vegalite(viewport_width=200, viewport_height=200) %>%
  cell_size(200, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/stocks.csv") %>%
  encode_x("date", "temporal") %>%
  encode_y("price", "quantitative") %>%
  encode_detail("symbol", "nominal") %>%
  mark_line()

## ------------------------------------------------------------------------
vegalite() %>%
  cell_size(200, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative", aggregate="mean") %>%
  encode_y("Displacement", "quantitative", aggregate="mean") %>%
  encode_detail("Origin", "nominal") %>%
  mark_point()

