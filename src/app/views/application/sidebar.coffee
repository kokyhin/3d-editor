define [
  "Backbone"
  "Marionette"
  "templates/application/sidebar"
],(
  Backbone
  Marionette
  template
) ->

  class SidebarView extends Marionette.ItemView
    template: template
