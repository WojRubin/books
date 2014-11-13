Books.BookController = Ember.ObjectController.extend
  actions:
    delete: ->
      if (window.confirm("Are you sure you want to delete this book?"))
        @get('content').deleteRecord()
        @transitionToRoute('books.index')
