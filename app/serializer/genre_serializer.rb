class GenreSerializer < ApplicationSerializer
  embed :ids, include: false
  attributes :id, :name
  
  has_many :books, :root => "books"
end