class EditRecipeBox < ActiveRecord::Migration
  def change
  	remove_column :recipe_boxes, :recipe_id
  	remove_column :recipe_boxes, :user_id
  end
end
