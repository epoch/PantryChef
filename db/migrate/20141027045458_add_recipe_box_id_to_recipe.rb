class AddRecipeBoxIdToRecipe < ActiveRecord::Migration
  def change
  	add_column :recipes, :recipe_box_id, :integer
  end
end
