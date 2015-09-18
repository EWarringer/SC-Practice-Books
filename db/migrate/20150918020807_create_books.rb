class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.integer :isbn_code, null: false
      t.string :description
      t.string :genre
    end
  end
end
