class BookSerializer < ApplicationSerializer
  attributes :id, :name, :isbn, :description, :genre_id

  has_many :authors, embed: :ids, include: false

end