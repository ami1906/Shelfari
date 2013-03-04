Shelfari.Views.Books ||= {}

class Shelfari.Views.Books.ShowView extends Backbone.View
  template: JST["backbone/templates/books/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
