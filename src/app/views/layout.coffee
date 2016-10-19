define [
  "Marionette"
  "Backbone"
  "Radio"
  "views/application/sidebar"
  "views/application/img-preview"
  "models/img-preview"
], (
  Marionette
  Backbone
  Radio
  SidebarView
  ImgLayoutView
  ImgPreviewModel
) ->

  class LayoutView extends Marionette.LayoutView
    el: "body"
    template: false

    regions:
      container: ".content-wrapper"
      sidebar:   ".js-sidebar"

    onRender: ->
      imgPreview = new ImgPreviewModel
      @sidebar.show new SidebarView
      @container.show new ImgLayoutView model: imgPreview

      Radio.channel('layout').reply
        'regions:container': @container
        'regions:sidebar': @sidebar
