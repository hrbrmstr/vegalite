HTMLWidgets.widget({

  name: 'vegalite',

  type: 'output',

  initialize: function(el, width, height) {
    return {};
  },

  renderValue: function(el, x, instance) {

  if (x.data.values !== null) {
    x.data.values = HTMLWidgets.dataframeToD3(x.data.values);
  }

  var vlSpec = {
    "data" : x.data,
    "mark" : x.mark,
    "encoding" : x.encoding,
    "config" : x.config
  };

  vls = vlSpec;
  par = x;

  var embedSpec = {
    mode: "vega-lite",  // Instruct Vega-Embed to use the Vega-Lite compiler
    spec: vlSpec
  };

  // Embed the visualization in the container with id `vis`
  vg.embed(el, embedSpec, function(error, result) {
    // Callback receiving the View instance and parsed Vega spec
    // result.view is the View, which resides under the '#vis' element
  });

  },

  resize: function(el, width, height, instance) { }

});
