Books.AuthorsRoute = Ember.Route.extend
  model: -> 
    return this.store.findAll('author')