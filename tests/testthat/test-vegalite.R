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
                                    "encoding", "config", "embed")))

})
