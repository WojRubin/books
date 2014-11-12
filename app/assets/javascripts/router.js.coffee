# For more information see: http://emberjs.com/guides/routing/

Books.Router.map ()->
  @resource 'books', { path: "/"}, ->
    @resource 'book', { path: '/book/:book_id' }
    @route 'new', {path: "/book/new"}
