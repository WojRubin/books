Books.GenresRoute = Ember.Route.extend
  model: -> 
    return this.store.findAll('genre')