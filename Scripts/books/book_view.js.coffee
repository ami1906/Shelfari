Shelfari.Views.Books ||= {}

class Shelfari.Views.Books.BookView extends Backbone.View
  template: JST["backbone/templates/books/book"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
