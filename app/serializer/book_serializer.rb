class BookSerializer < ApplicationSerializer
  embed :ids, :include => true
  
  attributes :id, :author, :genre
end