Books.BooksRoute = Ember.Route.extend
  model: -> 
    return this.store.find('book');