define [
  "Marionette"
  "Backbone"
  "Validation"
  "Radio"
  "router"
  "views/layout"
  "models/user"
], (
  Marionette
  Backbone
  Validation
  Radio
  Router
  LayoutView
  UserModel
) ->

  _.extend Backbone.Model.prototype, Backbone.Validation.mixin

  Marionette.Renderer.render = (template, data) ->
    if _.isFunction template
      template data
    else if template isnt false
      throw new Error "[Marionette Renderer]: Invalid template method"

  syncPrevious = Backbone.sync
  # Backbone.sync = (method, model, options) ->
  #   Radio.channel("layout").request("preloader:start")
  #   xhr = syncPrevious.apply @, arguments
  #   xhr.always -> Radio.channel("layout").request("preloader:stop")
  #   xhr

  # $(document).ajaxError (e, xhr, ajaxSettings, thrownError) ->
  #   if xhr.status in [401, 403]
  #     window.location.assign "/login"

  class App extends Marionette.Application

    onBeforeStart: ->
      @router = new Router
      Radio.channel("app").reply "router": @router

    onStart: ->
      Backbone.history.start()
