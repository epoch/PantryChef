class AddUserIdToRecipeBox < ActiveRecord::Migration
  def change
  	add_column :recipe_boxes, :user_id, :integer
  end
end
