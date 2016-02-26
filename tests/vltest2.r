# devtools::install_github("hrbrmstr/vegalite")
library(vegalite)
library(htmltools)

dat <- jsonlite::fromJSON('[
      {"a": "A","b": 28}, {"a": "B","b": 55}, {"a": "C","b": 43},
      {"a": "D","b": 91}, {"a": "E","b": 81}, {"a": "F","b": 53},
      {"a": "G","b": 19}, {"a": "H","b": 87}, {"a": "I","b": 52}
    ]')

vegalite(viewport_height=200, viewport_width=200) %>%
  cell_size(200, 200) %>%
  add_data(dat) %>%
  encode_x("a", "ordinal") %>%
  encode_y("b", "quantitative") %>%
  mark_bar() -> v1

vegalite(viewport_height=200, viewport_width=200) %>%
  cell_size(200, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/population.json") %>%
  encode_x("people", "quantitative", aggregate="sum") %>%
  encode_y("age", "ordinal") %>%
  scale_y_ordinal(band_size=17) %>%
  add_filter("datum.year == 2000") %>%
  mark_bar() -> v2

vegalite(viewport_height=200, viewport_width=200) %>%
  cell_size(200, 200) %>%
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
  mark_bar() -> v3

vegalite(viewport_height=200, viewport_width=200) %>%
  cell_size(200, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  mark_point() -> v4


vegalite(viewport_height=200, viewport_width=200) %>%
  cell_size(200, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  mark_circle() -> v5


vegalite(viewport_height=200, viewport_width=200) %>%
  cell_size(200, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("IMDB_Rating", "quantitative") %>%
  encode_y("Rotten_Tomatoes_Rating", "quantitative") %>%
  encode_size("*", "quantitative", aggregate="count") %>%
  bin_x(maxbins=10) %>%
  bin_y(maxbins=10) %>%
  mark_point() -> v6

vegalite(viewport_height=200, viewport_width=200) %>%
  cell_size(200, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json") %>%
  encode_x("date", "temporal") %>%
  encode_y("count", "quantitative", aggregate="sum") %>%
  encode_color("series", "nominal") %>%
  scale_color_nominal(range="category20b") %>%
  timeunit_x("yearmonth") %>%
  scale_x_time(nice="month") %>%
  axis_x(axisWidth=0, format="%Y", labelAngle=0) %>%
  mark_area(interpolate="basis", stack="center") -> v7

vegalite(viewport_height=200, viewport_width=200) %>%
  cell_size(200, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Cylinders", "ordinal") %>%
  mark_tick() -> v8



html_print(div(style="width:100%; max-width:100%",
               div(v1, style="float:left;padding:20px"),
               div(v2, style="float:left;padding:20px"),
               div(v3, style="float:left;padding:20px"),
               div(v4, style="float:left;padding:20px"),
               div(v5, style="float:left;padding:20px"),
               div(v6, style="float:left;padding:20px"),
               div(v7, style="float:left;padding:20px"),
               div(v8, style="float:left;padding:20px"))
)
