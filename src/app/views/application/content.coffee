define [
  "Marionette"
  "Radio"
  "templates/application/content"
], (
  Marionette
  Radio
  template
) ->

  class ContentLayoutView extends Marionette.ItemView
    template: template

    ui:
      preview: '.previewWrapper'
      button : '.js-choose'
      imgSlice: '.item'

    events:
      "click @ui.button": "onChooseClick"
      'click @ui.imgSlice': 'onItemClick'

    onChooseClick: ->
      @ui.preview.toggleClass 'active'

    onItemClick: (ev)->
      for item in $('.item')
        $(item).removeClass 'active'

      item = $(ev.currentTarget).closest '.item'
      item.addClass 'active'
      index = $(item).data 'index'