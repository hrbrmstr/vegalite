'use strict'

var split = require('dot-parts')

module.exports = function createAccessor (source, path) {
  return split(path).reduce(accumulate, source)
}

function accumulate (statement, property) {
  return statement + "['" + property + "']"
}
