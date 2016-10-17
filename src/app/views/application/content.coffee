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
