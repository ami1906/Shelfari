Shelfari.Views.Books ||= {}

class Shelfari.Views.Books.BookView extends Backbone.View
  template: JST["backbone/templates/books/book"]
  editTemplate: JST["backbone/templates/books/editBook"]
  tagName: "book"
  className: "book-container"
    
  events:
    "click button.delete" : "deleteBook"
    "click button.cancel" : "cancelEdit"
    "click button.edit" : "editBook"
    "click button.save" : "saveEdits"
    
  deleteBook: () ->
    @model.destroy()
    this.remove()

    return false
  
  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
  
  editBook: () ->
    @$el.html(@editTemplate(@model.toJSON() ))
  
  cancelEdit: () ->
    @render()
    
  saveEdits: (e) ->
    e.preventDefault()
    e.stopPropagation()
    name=$('#editBook #name').val()
    author=$('#editBook #author').val()
    status=$('#editBook #select').val()
    @model.save({name: name, author: author, status: status},
      success: (book) =>
        @model = book
      )
    @render()