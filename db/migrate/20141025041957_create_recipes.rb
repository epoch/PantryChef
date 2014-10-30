class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :course
      t.integer :cooktime
      t.integer :rating
      t.string :ingredients
      t.string :directions
      t.string :notes

      t.timestamps
    end
  end
end
