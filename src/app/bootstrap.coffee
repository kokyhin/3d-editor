require.config
  baseUrl: 'app'
  shim:
    'Bootstrap':
      'deps': [ 'jquery' ]
  paths:
    'jquery': '../lib/jquery/dist/jquery.min'
    'Bootstrap': '../lib/bootstrap/dist/js/bootstrap.min'
    'Marionette': '../lib/backbone.marionette/lib/backbone.marionette.min'
    'Backbone': '../lib/backbone/backbone-min'
    'underscore': '../lib/underscore/underscore-min'
    'Radio.shim': '../js/radio.shim'
    'Radio': '../lib/backbone.radio/build/backbone.radio'
    'Validation': '../lib/backbone.validation/dist/backbone-validation-amd-min'
  map:
    '*':
      'backbone': 'Backbone'
      'backbone.wreqr': 'Radio'
      'backbone.marionette': 'Marionette'
      'backbone.radio': 'Radio'

require [
  'jquery'
  'Bootstrap'
  'app'
  'Radio.shim'
], ($, Bootstrap, App, RadioShim) ->
  window.app = new App
  app.start()
