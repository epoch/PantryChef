class AddYummlyIdToRecipes < ActiveRecord::Migration
  def change
  	add_column :recipes, :yummly_id, :text
  	change_column :recipes, :image_url, :text
  end
end
