class CreateAuthorsHasBooks < ActiveRecord::Migration
  def change
    create_table :authors_books, id: false do |t|
      t.integer :author_id
      t.integer :book_id
    end
  end
end
