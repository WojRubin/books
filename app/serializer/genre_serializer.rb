class GenreSerializer < ApplicationSerializer
  embed :ids, include: true
  attributes :id, :name
  
  has_many :books, :root => "books"
end