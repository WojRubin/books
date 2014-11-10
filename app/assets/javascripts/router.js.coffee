# For more information see: http://emberjs.com/guides/routing/

Books.Router.map ()->
  this.resource('books', ->
    this.resource('book', { path: '/:book_id' }))

