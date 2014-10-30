class CreateJoinTableRecipeBoxesRecipes < ActiveRecord::Migration
  def change
    create_join_table :recipe_boxes, :recipes do |t|
      # t.index [:recipe_box_id, :recipe_id]
      # t.index [:recipe_id, :recipe_box_id]
    end
  end
end
