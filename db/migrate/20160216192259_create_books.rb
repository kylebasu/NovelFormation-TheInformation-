class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.datetime :publicationDate
      t.string :cover
      t.integer :author_id, :null => false
      t.timestamps null: false
    end
  end
end
