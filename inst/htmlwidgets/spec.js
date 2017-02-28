HTMLWidgets.widget({

  name: 'spec',

  type: 'output',

  initialize: function(el, width, height) {
    return {};
  },

  renderValue: function(el, x, instance) {

  par = x;

  var embedSpec = {
    "mode": "vega-lite",
    "spec": JSON.parse(x.spec),
    "renderer": x.renderer,
    "actions": {
      "export": x.export,
      "source": x.source,
      "editor": x.editor
    }
  };


    //add tooltip div
    if (d3.select("#vis-tooltip").empty()) {
      d3.select("body").append("div")
        .attr("id", "vis-tooltip")
        .attr("class", "vg-tooltip");

    } else {
      d3.select("#vis-tooltip").attr("class","vg-tooltip");
    }

  vg.embed(el, embedSpec, function(error, result) {
    // Callback receiving the View instance and parsed Vega spec
    // result.view is the View, which resides under the '#vis' element
    // added by Jia for vg tooltip
    vl.tooltip(result.view, JSON.parse(x.spec));
  });

  },

  resize: function(el, width, height, instance) { }

});
