Books.Genre = DS.Model.extend
  name: DS.attr('string')
  books: DS.hasMany('book')