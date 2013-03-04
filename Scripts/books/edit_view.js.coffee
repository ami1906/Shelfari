Shelfari.Views.Books ||= {}

class Shelfari.Views.Books.EditView extends Backbone.View
  template: JST["backbone/templates/books/edit"]

  events:
    "submit #edit-book": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (book) =>
        @model = book
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
