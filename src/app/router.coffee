define [
  "Marionette"
  "Radio"
  "views/application/404"
  "views/layout"

], (
  Marionette
  Radio
  NotFoundView
  ContentLayoutView
) ->

  class Router extends Marionette.AppRouter
    routes:
      "": "dashboard"
      "dashboard": "dashboard"
      "*All": "notFound"

    dashboard: ->
      contentLayout = new ContentLayoutView()

    notFound: ->
      Radio.channel("layout").request("regions:container").show new NotFoundView()
