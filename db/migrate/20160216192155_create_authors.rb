class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :biography
      t.datetime :birth
      t.datetime :death
      t.string :picture
      t.timestamps null: false
    end
  end
end
