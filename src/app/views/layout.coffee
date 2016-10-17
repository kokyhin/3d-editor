define [
  "Marionette"
  "Backbone"
  "Radio"
  "views/application/sidebar"
  "views/application/content"
], (
  Marionette
  Backbone
  Radio
  SidebarView
  ContainerView
) ->

  class LayoutView extends Marionette.LayoutView
    el: "body"
    template: false

    regions:
      container: ".content-wrapper"
      sidebar:   ".js-sidebar"

    onRender: ->
      @sidebar.show new SidebarView
      @container.show new ContainerView

      console.log 'layout rendered'

      Radio.channel('layout').reply
        'regions:container': @container
        'regions:sidebar': @sidebar
