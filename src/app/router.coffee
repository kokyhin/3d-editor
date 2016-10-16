define [
  "Marionette"
  "Radio"
  "views/application/404"
  "views/application/content"
  "collections/orders"
  "models/order"
  "views/orders/list"
  "views/orders/edit"
  "collections/spheres"
  "views/spheres/list"
], (
  Marionette
  Radio
  NotFoundView
  ContentLayoutView
  OrdersCollection
  OrderModel
  OrderListView
  OrderEditView
  SpheresCollection
  SpheresListView
) ->

  class Router extends Marionette.AppRouter
    routes:
      "": "dashboard"
      "dashboard": "dashboard"
      "*All": "notFound"

    dashboard: ->
      contentLayout = new ContentLayoutView()
      Radio.channel('layout').request('regions:container').show contentLayout

    notFound: ->
      Radio.channel("layout").request("regions:container").show new NotFoundView()
