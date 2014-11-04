class ChangeBooks < ActiveRecord::Migration
  def change
    rename_column :books, :genres, :genre
  end
end
