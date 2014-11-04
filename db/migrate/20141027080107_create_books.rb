class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :author
      t.string :genres

      t.timestamps
    end
  end
end
