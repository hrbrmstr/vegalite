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

  if (x.hasTransform) { vlSpec.transform = x.transform; }
  if (x.hasFacetCol) { vlSpec.encoding.column = x.facet.col; }
  if (x.hasFacetRow) { vlSpec.encoding.row = x.facet.row; }

  vls = vlSpec;
  par = x;

  var embedSpec = {
    "mode": "vega-lite",
    "spec": vlSpec,
    "renderer": x.embed.renderer,
    "actions": {
      "export": x.embed.actions.export,
      "source": x.embed.actions.source,
      "editor": x.embed.actions.editor
    }
  };

  vg.embed(el, embedSpec, function(error, result) {
    // Callback receiving the View instance and parsed Vega spec
    // result.view is the View, which resides under the '#vis' element
  });

  },

  resize: function(el, width, height, instance) { }

});
