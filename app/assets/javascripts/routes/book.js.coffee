Books.BookRoute = Ember.Route.extend
  model: (params) ->
    return this.store.find('book',params.book_id)
  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'books')