Books.Book = DS.Model.extend
  author: DS.attr('string')
  genre: DS.belongsTo('Books.Genre')
