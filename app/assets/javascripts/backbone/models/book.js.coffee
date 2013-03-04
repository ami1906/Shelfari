class Shelfari.Models.Book extends Backbone.Model
  paramRoot: 'book'

  defaults:
    name: null
    author: null
    status: null

class Shelfari.Collections.BooksCollection extends Backbone.Collection
  model: Shelfari.Models.Book
  url: '/books'
