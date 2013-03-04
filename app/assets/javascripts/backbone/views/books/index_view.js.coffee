Shelfari.Views.Books ||= {}

class Shelfari.Views.Books.IndexView extends Backbone.View
  template: JST["backbone/templates/books/index"]
  
  tag: '#books'
  events:  
    "keypress li .search": "updateOnEnter"
    "click #add": "addBook"
    "click .addition": "showForm"
    
    
  initialize: () ->
    @render()
    @options.books.on("reset", @render, @)
    @options.books.on("add", @addOne, @)
  

  updateOnEnter: (e) ->
     if e.which==13
       @filterValue=@input.val().trim().toLowerCase()
       @$el.find("book").remove()
       @options.books.each(@filter)
  
  filter: (book) =>
     
    if book.get("name").toLowerCase()==@filterValue
      view = new Shelfari.Views.Books.BookView({model : book})
      @$('#books').append(view.render().el)
            
  addBook: () ->
     name=$("#addBook #name").val()
     author=$("#addBook #author").val()
     status=$("#addBook #select").val()
     model=new Shelfari.Models.Book({name:name, author:author, status:status})
     @options.books.create model, 
     success: (book) =>
       @model=book
     @options.books.add(model)
     $("#addBook #name").val("")
     $("#addBook #author").val("")
   
     
  showForm: ()->
    @$el.find("#addBook").slideToggle()
     
  addAll: () =>
    @options.books.each(@addOne)
    
  addOne: (book) =>
    view = new Shelfari.Views.Books.BookView({model : book})
    @$('#books').append(view.render().el)

  render: =>
    @$el.find("book").remove()
    @$el.html(@template(books: @options.books.toJSON() ))
    @input=@.$('li .search')
    @addAll()

    return this
