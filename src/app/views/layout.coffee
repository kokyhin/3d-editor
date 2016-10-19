define [
  "Marionette"
  "Backbone"
  "Radio"
  "views/application/sidebar"
  "views/application/img-preview"
], (
  Marionette
  Backbone
  Radio
  SidebarView
  imgLayoutView
) ->

  class LayoutView extends Marionette.LayoutView
    el: "body"
    template: false

    regions:
      container: ".content-wrapper"
      sidebar:   ".js-sidebar"

    onRender: ->
      @sidebar.show new SidebarView
      @container.show new imgLayoutView

      Radio.channel('layout').reply
        'regions:container': @container
        'regions:sidebar': @sidebar
