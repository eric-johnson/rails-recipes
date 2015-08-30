class Ingredients < ActiveRecord::Migration
  def change
  	create_table :ingredients do |t|
      t.string :name, null: false
      t.decimal :magnitude
      t.string :unit
      t.integer :recipe_id, null: false
  	end
  end
end
