# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  course      :string(255)
#  cooktime    :integer
#  rating      :integer
#  ingredients :string(255)
#  directions  :string(255)
#  notes       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  image_url   :string(255)
#

class Recipe < ActiveRecord::Base
	has_and_belongs_to_many :recipe_boxes
	has_many :users, through: :recipe_boxes
	
end
