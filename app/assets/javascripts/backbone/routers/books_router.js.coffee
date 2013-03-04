class Shelfari.Routers.BooksRouter extends Backbone.Router
  initialize: (options) ->
    @books = new Shelfari.Collections.BooksCollection()
    @books.reset options.books

  routes:
    "index"    : "index"
    ".*"        : "index"
 
  index: ->
    @view = new Shelfari.Views.Books.IndexView(books: @books)
    $("#container").append(@view.render().el)

