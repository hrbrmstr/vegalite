HTMLWidgets.widget({
  name: 'vegalite',

  type: 'output',

  initialize: function(el, width, height) {
    return {
    };
  },

  renderValue: function(el, x, instance) {

    // if embedded data, turn R data.frame into a usable structure
    if (x.data.hasOwnProperty("values")) {
      x.data.values = HTMLWidgets.dataframeToD3(x.data.values);
    }

    var vlSpec = {
      "data" : x.data,
      "mark" : x.mark,
      "encoding" : x.encoding,
      "config" : x.config,
      "transform" : x.transform
    };

    //if (x.hasOwnProperty("transform")) {
    //  vlSpec.transform = x.transform;
    //}


    var embedSpec = {
      "mode": "vega-lite",
      "renderer": x.embed.renderer,
      "actions": {
        "export": x.embed.actions.export,
        "source": x.embed.actions.source,
        "editor": x.embed.actions.editor
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
