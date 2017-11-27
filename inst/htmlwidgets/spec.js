HTMLWidgets.widget({

  name: 'spec',

  type: 'output',

  initialize: function(el, width, height) {
    return {};
  },

  renderValue: function(el, x, instance) {


  var vlSpec = JSON.parse(x.spec);

  var embedSpec = {
    "mode": "vega-lite",
    "renderer": x.renderer,
    "actions": {
      "export": x.export,
      "source": x.source,
      "editor": x.editor
    }
  };


  vegaEmbed(el, vlSpec, embedSpec).then(function(result) {
      // Callback receiving the View instance and parsed Vega spec
      // result.view is the View, which resides under the '#vis' element
      vegaTooltip.vegaLite(result.view, vlSpec);
    }).catch(console.error);


  },

  resize: function(el, width, height, instance) { }

});
