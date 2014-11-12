# For more information see: http://emberjs.com/guides/routing/

Books.Router.map ()->
  @resource 'books', ->
    @resource 'book', { path: '/:book_id' }
    @route 'new', {path: "/new"}
