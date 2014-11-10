Books.BooksRoute = Ember.Route.extend
  model: -> 
    return this.store.findAll('book')