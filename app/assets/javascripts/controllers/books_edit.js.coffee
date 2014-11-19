Books.BooksEditController = Ember.ObjectController.extend
  actions:
    delete: ->
      if (window.confirm("Are you sure you want to delete this?"))
        @get('model').destroyRecord()
        @transitionToRoute('books.index')
    save: ->
      this.get('model').save().then =>
        @transitionToRoute('books')