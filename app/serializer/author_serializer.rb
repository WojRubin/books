class AuthorSerializer < ApplicationSerializer

  attributes :id, :first_name, :last_name

  has_many :books
end