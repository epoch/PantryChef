class ChangeColumnIngredients < ActiveRecord::Migration
  def change
  	change_column :recipes, :ingredients, :text
  	remove_column :recipes, :directions
  end
end
