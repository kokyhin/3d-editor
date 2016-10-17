define [
  "Marionette"
  "Backbone"
  "Validation"
  "Radio"
  "router"
  "views/layout"
], (
  Marionette
  Backbone
  Validation
  Radio
  Router
  LayoutView
) ->

  _.extend Backbone.Model.prototype, Backbone.Validation.mixin

  Marionette.Renderer.render = (template, data) ->
    if _.isFunction template
      template data
    else if template isnt false
      throw new Error "[Marionette Renderer]: Invalid template method"

  class App extends Marionette.Application

    onBeforeStart: ->
      @router = new Router
      Radio.channel("app").reply "router": @router

    onStart: ->
      @layout = new LayoutView
      @layout.render()

      Backbone.history.start()