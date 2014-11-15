class AddRelationWithAuthorGenreAddIsbnNameDescriptionToBooks < ActiveRecord::Migration
  def change
    remove_column :books, :author
    remove_column :books, :genre
    add_column :books, :genre_id, :integer
    add_column :books, :name, :string
    add_column :books, :isbn, :integer
    add_column :books, :description, :string
  end
end
