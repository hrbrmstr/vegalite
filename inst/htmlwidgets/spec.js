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

  vg.embed(el, embedSpec, function(error, result) {
    // Callback receiving the View instance and parsed Vega spec
    // result.view is the View, which resides under the '#vis' element
  });

  },

  resize: function(el, width, height, instance) { }

});
