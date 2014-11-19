Books.Book = DS.Model.extend
  name: DS.attr('string')
  description: DS.attr('string')
  isbn: DS.attr('number')
  genre: DS.belongsTo('genre', { async: true })
  authors: DS.hasMany('author', { async: true })
