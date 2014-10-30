# == Schema Information
#
# Table name: recipe_boxes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  recipe_id  :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class RecipeBox < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :recipes
end
