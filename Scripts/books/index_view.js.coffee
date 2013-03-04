Shelfari.Views.Books ||= {}

class Shelfari.Views.Books.IndexView extends Backbone.View
  template: JST["backbone/templates/books/index"]

  initialize: () ->
    @options.books.bind('reset', @addAll)

  addAll: () =>
    @options.books.each(@addOne)

  addOne: (book) =>
    view = new Shelfari.Views.Books.BookView({model : book})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(books: @options.books.toJSON() ))
    @addAll()

    return this
