define [
  "Marionette"
  "Radio"
  "templates/application/img-preview"
], (
  Marionette
  Radio
  template
) ->

  class imgLayoutView extends Marionette.ItemView
    template: template

    ui:
      preview: '.previewWrapper'
      button : '.js-choose'
      imgSlice: '.item'
      imgPreview: '#preview-choosen-slice img'

    events:
      "click @ui.button": "onChooseClick"
      'click @ui.imgSlice': 'onItemClick'

    onChooseClick: ->
      @ui.preview.toggleClass 'active'
      @ui.imgPreview.toggleClass 'hidden'

    onItemClick: (ev)->
      for item in $('.item')
        $(item).removeClass 'active'

      item = $(ev.currentTarget).closest '.item'
      item.addClass 'active'
      index = $(item).data('index') - 1
      @ui.imgPreview.attr('src', 'img/sphere/tile_' + index + '.jpg')

    onRender: ->
      console.log @model.get('name')