class CreateRecipeBoxes < ActiveRecord::Migration
  def change
    create_table :recipe_boxes do |t|
      t.string :name
      t.integer :recipe_id
      t.integer :user_id

      t.timestamps
    end
  end
end
