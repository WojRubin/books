class BookSerializer < ApplicationSerializer
  attributes :id, :name, :isbn, :description
  belongs_to :genre
end