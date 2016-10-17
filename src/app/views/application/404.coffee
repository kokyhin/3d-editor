define [
  "Marionette"
  "templates/application/404"
], (
  Marionette
  template
) ->

  class NotFoundView extends Marionette.ItemView
    template: template
    className: "content-wrapper"