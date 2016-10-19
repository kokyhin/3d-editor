define [
  "models/_base_model"
], (
  AppModel
) ->

  class ImgPreviewModel extends AppModel
    defaults:
      name: 'NameTheme'

    fetch: ->
