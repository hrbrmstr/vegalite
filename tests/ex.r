#' ---
#' title: "vegalite test"
#' author: "@hrbrmstr"
#' date: ""
#' output: hrbrmrkdn::skeleton
#' ---

#devtools::install_github("hrbrmstr/vegalite")
library(vegalite)

#' ### bar mark

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

#' ### point mark

vegalite() %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  mark_point()

#' ### cirlce mark

vegalite() %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  mark_circle()

#' ### color and shape

vegalite() %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  encode_color("Origin", "nominal") %>%
  encode_shape("Origin", "nominal") %>%
  mark_point()

#' ### size

vegalite() %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  encode_size("Acceleration", "quantitative") %>%
  mark_point()

#' ### filtered line

vegalite() %>%
  cell_size(400, 450) %>%
  add_data("https://vega.github.io/vega-editor/app/data/stocks.csv") %>%
  add_filter("datum.symbol==='GOOG'") %>%
  encode_x("date", "temporal") %>%
  encode_y("price", "quantitative") %>%
  mark_line()

#' ### ticks

vegalite(viewport_height=200) %>%
  cell_size(400, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Cylinders", "ordinal") %>%
  mark_tick()

#' ### multi-series line

vegalite(viewport_height=500) %>%
  cell_size(400, 400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/stocks.csv") %>%
  encode_x("date", "temporal") %>%
  encode_y("price", "quantitative") %>%
  encode_color("symbol", "nominal") %>%
  mark_line()

#' ### facet col

vegalite(viewport_height=350) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("Worldwide_Gross", "quantitative") %>%
  encode_y("US_DVD_Sales", "quantitative") %>%
  facet_col("MPAA_Rating", "ordinal") %>%
  mark_point()

#' ### facet row

vegalite(viewport_height=1400) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("Worldwide_Gross", "quantitative") %>%
  encode_y("US_DVD_Sales", "quantitative") %>%
  facet_row("MPAA_Rating", "ordinal") %>%
  mark_point()

#' ### facet both

vegalite(viewport_height=2900) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("Worldwide_Gross", "quantitative") %>%
  encode_y("US_DVD_Sales", "quantitative") %>%
  facet_col("MPAA_Rating", "ordinal") %>%
  facet_row("Major_Genre", "ordinal") %>%
  mark_point()

#' ### log scale

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

#' ### aggregate bar chart

vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/population.json") %>%
  encode_x("people", "quantitative") %>%
  aggregate_x("sum") %>%
  encode_y("age", "ordinal") %>%
  scale_y_ordinal(band_size=17) %>%
  add_filter("datum.year == 2000") %>%
  mark_bar()

#' ### binned scatterplot

vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("IMDB_Rating", "quantitative") %>%
  encode_y("Rotten_Tomatoes_Rating", "quantitative") %>%
  encode_size("*", "quantitative") %>%
  bin_x(maxbins=10) %>%
  bin_y(maxbins=10) %>%
  aggregate_size("count") %>%
  mark_point()

#' ### slope graph

vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/barley.json") %>%
  encode_x("year", "ordinal") %>%
  encode_y("yield", "quantitative") %>%
  encode_color("site", "nominal") %>%
  aggregate_y("median") %>%
  scale_x_ordinal(band_size=50, padding=0.5) %>%
  mark_line()

#' ### histogram

vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("IMDB_Rating", "quantitative") %>%
  encode_y("*", "quantitative") %>%
  bin_x(maxbins=10) %>%
  aggregate_y("count") %>%
  mark_bar()

#' ### stacked bar chart

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

#' ### horizontal stacked bar chart

vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/barley.json") %>%
  encode_x("yield", "quantitative") %>%
  encode_y("variety", "nominal") %>%
  encode_color("site", "nominal") %>%
  aggregate_x("sum") %>%
  mark_bar()

#' ### stacked area chart

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

#' ### streamgraph!

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

