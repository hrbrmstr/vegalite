context("Widget structures created successfully")
test_that("we can do something", {

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
    mark_bar() -> vl

  expect_that(names(vl), equals(c("x", "width", "height", "sizingPolicy",
                                  "dependencies", "elementId",
                                  "preRenderHook", "jsHooks")))

  expect_that(names(vl$x), equals(c("description", "data", "mark",
                                    "encoding", "config","transform","embed")))

})

test_that("vega1 can be created correctly", {
  ex1 <- jsonlite::read_json(system.file('extdata',
                                         'vega1.json',
                                         package = 'vegalite'))
  dat <- jsonlite::fromJSON('[
    {"a": "C", "b": 2}, {"a": "C", "b": 7}, {"a": "C", "b": 4},
    {"a": "D", "b": 1}, {"a": "D", "b": 2}, {"a": "D", "b": 6},
    {"a": "E", "b": 8}, {"a": "E", "b": 4}, {"a": "E", "b": 7}
  ]')

  vl1 <- vegalite() %>%
         add_data(dat) %>%
         mark_point() %>%
         encode_x('a', type = 'nominal') %>%
         encode_y('b', type = 'quantitative')
  ex1_dat <- as.data.frame(apply(do.call(rbind, ex1$data$values), 2, unlist),
                           stringsAsFactors = FALSE)
  ex1_dat$a <- as.character(ex1_dat$a)
  ex1_dat$b <- as.numeric(ex1_dat$b)
  expect_equal(ex1_dat, vl1$x$data$values)
  expect_equal(ex1$mark, vl1$x$mark)
  expect_equal(ex1$encoding, vl1$x$encoding)
})

test_that("vega2 can be created correctly", {
  ex2 <- jsonlite::read_json(system.file('extdata',
                                         'vega2.json',
                                         package = 'vegalite'))
  vl2 <- vegalite(description = 'A scatterplot showing horsepower and miles per gallons for various cars.') %>%
         add_data(source = 'https://vega.github.io/vega-lite/data/cars.json') %>%
         mark_point() %>%
         encode_x('Horsepower', type = 'quantitative') %>%
         encode_y('Miles_per_Gallon', type = 'quantitative')
  expect_equal(vl2$x$data$url, ex2$data$url)
  expect_equal(ex2$mark, vl2$x$mark)
  expect_equal(ex2$encoding, vl2$x$encoding)
})

test_that("vega3 can be created correctly", {
  ex3 <- jsonlite::read_json(system.file('extdata',
                                         'vega3.json',
                                         package = 'vegalite'))
  vl3 <- vegalite() %>%
    add_data(source = 'https://vega.github.io/vega-lite/data/cars.json') %>%
    mark_point() %>%
    encode_x('Horsepower', type = 'quantitative')
  expect_equal(ex3$data$url, vl3$x$data$url)
  expect_equal(ex3$mark, vl3$x$mark)
  expect_equal(ex3$encoding, vl3$x$encoding)
})


test_that("vega4 can be created correctly", {
  ex4 <- jsonlite::read_json(system.file('extdata',
                                         'vega4.json',
                                         package = 'vegalite'))
  vl4 <- vegalite(description = "A scatterplot showing horsepower and miles per gallons.") %>%
    add_data(source = 'https://vega.github.io/vega-lite/data/cars.json') %>%
    mark_point() %>%
    encode_x('Horsepower', type = 'quantitative') %>%
    encode_y('Miles_per_Gallon', type = 'quantitative') %>%
    encode_color('Origin', type = 'nominal') %>%
    encode_shape('Origin', type = 'nominal')

  expect_equal(ex4$data$url, vl4$x$data$url)
  expect_equal(ex4$mark, vl4$x$mark)
  expect_equal(ex4$encoding, vl4$x$encoding)
})

test_that("vega5 can be created correctly", {
  ex5 <- jsonlite::read_json(system.file('extdata',
                                         'vega5.json',
                                         package = 'vegalite'))
  vl5 <- vegalite(description = "A bubbleplot showing horsepower on x, miles per gallons on y, and binned acceleration on size.") %>%
    add_data(source = 'https://vega.github.io/vega-lite/data/cars.json') %>%
    mark_point() %>%
    encode_x('Horsepower', type = 'quantitative') %>%
    encode_y('Miles_per_Gallon', type = 'quantitative') %>%
    encode_size('Acceleration', type = 'quantitative')

  expect_equal(ex5$data$url, vl5$x$data$url)
  expect_equal(ex5$mark, vl5$x$mark)
  expect_equal(ex5$encoding, vl5$x$encoding)
})

test_that("vega6 can be created correctly", {
  ex6 <- jsonlite::read_json(system.file('extdata',
                                         'vega6.json',
                                         package = 'vegalite'))
  vl6 <- vegalite(description = "A bubbleplot showing horsepower on x, miles per gallons on y, and binned acceleration on size.") %>%
    add_data(source = 'https://vega.github.io/vega-lite/data/cars.json') %>%
    mark_circle() %>%
    encode_x('Horsepower', type = 'quantitative') %>%
    encode_y('Miles_per_Gallon', type = 'quantitative')

  expect_equal(ex6$data$url, vl6$x$data$url)
  expect_equal(ex6$mark, vl6$x$mark)
  expect_equal(ex6$encoding, vl6$x$encoding)
})

test_that("vega7 can be created correctly", {
  ex7 <- jsonlite::read_json(system.file('extdata',
                                         'vega7.json',
                                         package = 'vegalite'))
  vl7 <- vegalite() %>%
    add_data(source = 'https://vega.github.io/vega-lite/data/cars.json') %>%
    mark_square() %>%
    encode_x('Horsepower', type = 'quantitative') %>%
    encode_y('Miles_per_Gallon', type = 'quantitative')

  expect_equal(ex7$data$url, vl7$x$data$url)
  expect_equal(ex7$mark, vl7$x$mark)
  expect_equal(ex7$encoding, vl7$x$encoding)
})

test_that("vega9 can be created correctly", {
  ex9 <- jsonlite::read_json(system.file('extdata',
                                         'vega9.json',
                                         package = 'vegalite'))
  vl9 <- vegalite("Stock prices of 5 Tech Companies Over Time.") %>%
    add_data(source = "https://vega.github.io/vega-lite/data/stocks.csv",
             format_type = "csv") %>%
    mark_line() %>%
    encode_x('date', type = 'temporal') %>%
    encode_y('price', type = 'quantitative') %>%
    encode_color('symbol', type = 'nominal')

  expect_equal(ex9$data, vl9$x$data)
  expect_equal(ex9$mark, vl9$x$mark)
  expect_equal(ex9$encoding, vl9$x$encoding)
})