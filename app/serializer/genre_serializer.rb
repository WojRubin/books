class GenreSerializer < ApplicationSerializer

  attributes :id, :name
  has_many :books
end