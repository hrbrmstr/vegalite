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

vegalite(viewport_height=1600) %>%
  cell_size(100, 100) %>%
  add_data("https://vega.github.io/vega-editor/app/data/movies.json") %>%
  encode_x("Worldwide_Gross", "quantitative") %>%
  encode_y("US_DVD_Sales", "quantitative") %>%
  facet_col("MPAA_Rating", "ordinal") %>%
  facet_row("Major_Genre", "ordinal") %>%
  mark_point()

