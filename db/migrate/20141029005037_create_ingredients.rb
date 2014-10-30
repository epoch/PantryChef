class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.text :search_ingredients
      t.integer :recipe_id

      t.timestamps
    end
  end
end
