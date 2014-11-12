Books.BooksNewRoute = Books.BooksRoute.extend
  model: ->
    return this.store.createRecord('book')
  actions:
    save: ->
      route = this
      this.currentModel.save()
      route.transitionTo('books')