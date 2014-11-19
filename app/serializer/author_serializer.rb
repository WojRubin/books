class AuthorSerializer < ApplicationSerializer
  embed :ids, include: false

  attributes :id, :first_name, :last_name
  has_many :books
end