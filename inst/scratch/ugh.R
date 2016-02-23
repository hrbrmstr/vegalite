
spec <- '{
  "description": "A bar chart showing the US population distribution of age groups in 2000.",
  "data": {
    "url": "https://vega.github.io/vega-lite/data/population.json"
  },
  "transform": {
    "filter": "datum.year == 2000"
  },
  "mark": "bar",
  "encoding": {
    "y": {
      "field": "age",
      "type": "ordinal",
      "scale": {
        "bandSize": 17
      }
    },
    "x": {
      "aggregate": "sum",
      "field": "people",
      "type": "quantitative",
      "axis": {
        "title": "population"
      }
    }
  }
}'



ss <- ct$call("global.vegalite.compile", good_spec)
dat <- ct$call("global.vegalite.validate", ss)
jsonview::json_view(ss)

ct$eval("function parseModel(spec) { return global.vegalite.Model(spec); }")
model <- ct$call("parseModel", JS(spec))


bin,channel,compile,data,encoding,fieldDef,schema,shorthand,spec,timeUnit,type,util,validate,version
